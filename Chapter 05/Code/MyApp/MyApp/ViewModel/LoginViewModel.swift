//
//  LoginViewModel.swift
//  MyApp
//
//  Created by apple on 19/08/22.
//

import Foundation

class LoginViewModel {
    
    func login(email: String, password: String) {
        
        if Validator.validate(email: email, password: password) {
            Network.login(user: User(email: email, password: password)) { result in
                switch result {
                case .success(_):
                    Persistence.saveLoginState()
                    Navigator.navigateToHome()
                    break
                case .failure(_):
                    // show error msg
                    break
                }
            }
        } else {
            // show error msg
        }
    }
}
