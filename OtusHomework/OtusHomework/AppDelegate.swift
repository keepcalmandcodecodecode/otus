//
//  AppDelegate.swift
//  TaskAboutStoryboards
//
//  Created by developer on 5/28/19.
//  Copyright © 2019 developer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print(#function)
        return true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print(#function)
        return true
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print(#function)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print(#function)
        let userDefaults = UserDefaults.standard
        userDefaults.addSuite(named: "group.igor.lepeshkin.otus.homework")
        print(userDefaults.value(forKey: "sharedText"))
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print(#function)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print(#function)
    }


    func applicationWillTerminate(_ application: UIApplication) {
        print(#function)
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let userDefaults = UserDefaults.standard
        userDefaults.addSuite(named: "group.igor.lepeshkin.otus.homework")
        print(userDefaults.value(forKey: "sharedText"))
        return true
    }

}

