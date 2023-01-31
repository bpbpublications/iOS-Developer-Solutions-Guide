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
    
    let apiKey: String
    
    public init(apiKey: String) {
        
        // MARK: if api key is missing show error
        if apiKey.count == 0 {
            fatalError("API key is missing for using this framework")
        }
        
        // MARK: make api call to verify API key then
        
        // MARK: On success do this:
            self.apiKey = apiKey
        
        // MARK: On failure do this:
            // fatalError("Invalide API key")
    }
    
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
