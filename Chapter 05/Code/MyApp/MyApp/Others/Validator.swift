//
//  Validator.swift
//  MyApp
//

import Foundation

class Validator {
    
    static func validate(email: String, password: String) -> Bool {
        var validated = true
        if email.count == 0 || password.count == 0 { validated = false }
        if email.count >= 100 || password.count > 16 { validated = false }
        if !isEmailValid(email: email) { validated = false }
        return validated
    }
    static func isEmailValid(email: String) -> Bool {
        return true
    }
}

