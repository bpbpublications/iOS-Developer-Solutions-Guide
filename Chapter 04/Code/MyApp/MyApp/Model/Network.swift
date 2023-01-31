//
//  Network.swift
//  MyApp
//

import Foundation

typealias LoginClosure = (Result<UserResponse, Error>) -> Void
typealias LogoutClosure = (Result<Bool, Error>) -> Void

class Network {
    
    static func login(user: User, completion:LoginClosure) {
        
        let userResponse = UserResponse(email: "a@b.com",
                                        id: "12345",
                                        firstName: "Steven",
                                        middleName: "Pual",
                                        lastName: "Jobs")
        
        completion(.success(userResponse))
    }
    
    static func logout(id: String, completion:LogoutClosure) {
        
        completion(.success(true))
        
    }
}

