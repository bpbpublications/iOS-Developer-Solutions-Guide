//
//  Persistence.swift
//  MyApp
//

import Foundation

class Persistence {
    
    static func saveLoginState() {
        
        let standard = UserDefaults.standard
        standard.setValue(true, forKey: kLogin)
        
    }
    
    static func saveLogoutState() {
        
        let standard = UserDefaults.standard
        standard.removeObject(forKey: kLogin)
        
    }
    
}






