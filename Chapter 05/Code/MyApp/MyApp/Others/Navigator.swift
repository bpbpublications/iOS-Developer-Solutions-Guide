//
//  Navigator.swift
//  MyApp
//

import Foundation
import UIKit

class Navigator {
    
    static var window: UIWindow!
    static var navigationController: UINavigationController?
    
    static func setRootScreen(_ window:UIWindow) {
        
        self.window = window
        let standard = UserDefaults.standard
        
        if standard.bool(forKey: kLogin) {
            let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
            navigationController = UINavigationController(rootViewController: homeViewController)
            self.window.rootViewController = navigationController
        } else {
            let loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
            navigationController = UINavigationController(rootViewController: loginViewController)
            self.window.rootViewController = navigationController
        }
        navigationController?.isNavigationBarHidden = true
    }
    
    static func navigateToHome() {
        setRootScreen(self.window)
    }
}



