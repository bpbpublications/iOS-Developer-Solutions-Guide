//
//  EmailValidator.swift
//  MyFramework
//

import Foundation

// MARK: Regular expression for email
private let emailRegEx: String = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"

// MARK: Regular expression for email
enum ValidationError: Error {
    
    case EmptyEmail
    case InvalidEmail
    
}

// MARK: EmailValidator
public class EmailValidator {
    
    public init() { }
    
    public func isEmailValid(email:String) throws -> Bool {
        
        // empty check
        if email.isEmpty {
            throw ValidationError.EmptyEmail
        }
        
        // email validation check using regular expression
        do {
            let nsrange: NSRange = NSRange(location: 0, length: email.count)
            if try NSRegularExpression(pattern: emailRegEx,
                                       options: .caseInsensitive).firstMatch(in: email,
                                                                             options: [],
                                                                             range: nsrange) == nil {
                
                throw ValidationError.InvalidEmail
            }
        } catch {
            throw ValidationError.InvalidEmail
        }
        return true
    }
}
