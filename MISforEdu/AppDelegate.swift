//
//  AppDelegate.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/16/24.
//

import UIKit
//import AppCenter
//import AppCenterAnalytics
//import AppCenterCrashes

//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    /* visual code app center API
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
              AppCenter.start(withAppSecret: "c34b14a6-8e05-4a28-9d7f-aabd5176ca93", services:[
                Crashes.self, Analytics.self])//, Distribute.self
            return true
        }
    */
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

