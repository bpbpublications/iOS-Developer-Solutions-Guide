//
//  AppDelegate.swift
//  MyApp
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions:[UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        Navigator.setRootScreen(window!)
        window!.makeKeyAndVisible()
        return true
    }
}

