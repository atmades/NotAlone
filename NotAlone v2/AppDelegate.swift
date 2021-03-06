//
//  AppDelegate.swift
//  NotAlone v2
//
//  Created by Максим on 08.11.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import UIKit
import GoogleMaps

private let apiKey = ""
// GMSServices.provideAPIKey(apiKey)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GMSServices.provideAPIKey(apiKey)
        
//        Новое
//        UINavigationBar.appearance().barTintColor = UIColor.red
//        
//        // Set Navigation bar Title colour
//        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
//        
//        // Set navigation bar ItemButton tint colour
//        UIBarButtonItem.appearance().tintColor = UIColor.yellow
//        
//        // Set Navigation bar background image
//        let navBgImage:UIImage = UIImage(named: "avatarDef")!
//        UINavigationBar.appearance().setBackgroundImage(navBgImage, for: .default)
//        
//        //Set navigation bar Back button tint colour
//        UINavigationBar.appearance().tintColor = UIColor.white
        
//     ---
        
//        Еще один вариант с ларге тайтле
        
        
        
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

