//
//  AppDelegate.swift
//  Demo3DTouch
//
//  Created by Isaías on 5/10/18.
//  Copyright © 2018 Isaías. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if #available(iOS 9.0, *) {
            let shortcut = UIApplicationShortcutItem(type: "chat", localizedTitle: "Chat Titulo")
            application.shortcutItems = [shortcut]
        }
        
        
        return true
    }
    
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        if shortcutItem.type == "chat" {
            print("Chat ShortcutItem seleccionado")
            // Abrir View Controller que corresponda
        }
        else if shortcutItem.type == "mensajes"{
            print("mensajes ShortcutItem seleccionado")
            // Abrir View Controller que corresponda
        }
        else if shortcutItem.type == "inicio"{
            print("inicio ShortcutItem seleccionado")
            // Abrir View Controller que corresponda
        }
    }

}

