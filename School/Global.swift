//
//  Global.swift
//  RealmTest
//
//  Created by mis on 15.02.21.
//
//  Copyright (c) [2021] [Michael Schmidt, michael.schmidt@app-making.de]
//  You can use it under the MIT License (You find it in file LICENSE)
//

import Foundation
import Cocoa
import RealmSwift

//  vorhandene Daten loeschen, Debug
let REMOVE_REALM_DATA: Bool = false
let USE_ANON_AUTH           = false

//  Synchronisation mit Cloud
internal struct RealmAppSettings {

    static let USE_REALM_SYNC: Bool     = true
    static let REALM_APP_ID: String     = "realmtestapp-guiuw"
    
}

//  Delegate fuer Cloud-Realm
protocol RealmDelegate: class {
    
    func cloudRealmWasInit(_ wasInitialized: Bool, _ userRealm: Realm?)
    func schoolWasAdded(_ school: School)
    
}

//  UserDefaults
public struct UserSettings {
    
    static let LAST_USED_SCHOOL_NAME: String    = "LastUsedSchoolName"
    static let FIRST_RUN_STEP: String           = "FirstRunStep"
    static let USE_REALM_SYNC: String           = "UseRealmSync"
    static let SAVE_LOGIN: String               = "SaveLogin"
    static let LAST_USED_EMAIL: String          = "LastUsedEMail"
    
    static func keyExists(_ key: String) -> Bool {
        
        guard let _ = UserDefaults.standard.object(forKey: key) else {
            
            return false
            
        }

       return true
    }
    
}

//  Standard-Dialoge
public class ModalOptionDialog {
    
    public struct ButtonStyle {
        
        static let OK_OPTION: Int           = 1
        static let OK_CANCEL_OPTION: Int    = 2
        static let YES_NO_OPTION: Int       = 3
        
    }
    
    public struct DialogStyle {
        
        static let INFORMATION: Int    = 1
        static let WARNING: Int        = 2
        static let CRITICAL: Int       = 3
        
    }
    
    private let alert: NSAlert
    
    public init(message: String, buttonStyle: Int, dialogStyle: Int) {
        
        alert = NSAlert()
        alert.messageText = message
        
        switch buttonStyle {
        case ButtonStyle.OK_OPTION:
            alert.addButton(withTitle: "Ok")
        case ButtonStyle.OK_CANCEL_OPTION:
            alert.addButton(withTitle: "Ok")
            alert.addButton(withTitle: "Abbrechen")
        case ButtonStyle.YES_NO_OPTION:
            alert.addButton(withTitle: "Ja")
            alert.addButton(withTitle: "Nein")
        default:
            alert.addButton(withTitle: "Ok")
        }

        switch dialogStyle {
        case DialogStyle.INFORMATION:
            alert.icon = NSImage(named: "information")
            alert.alertStyle = .informational
        case DialogStyle.WARNING:
            alert.icon = NSImage(named: "warning")
            alert.alertStyle = .warning
        case DialogStyle.CRITICAL:
            alert.icon = NSImage(named: "critical")
            alert.alertStyle = .critical
        default:
            alert.icon = NSImage(named: "information")
            alert.alertStyle = .informational
        }
        
    }
    
    public func showDialog() {
        
        alert.runModal()
        
    }
    
}
