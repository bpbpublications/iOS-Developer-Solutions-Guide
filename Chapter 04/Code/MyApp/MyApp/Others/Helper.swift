//
//  Helper.swift
//  MyApp
//

import Foundation
import UIKit

class Helper {
    
    static func appVersion() -> String {
        let ver = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "1.0.0"
        return "Version: \(ver)"
    }
    
    static func roundButton(button:UIButton) {
        button.layer.cornerRadius = 5.0
    }
}

