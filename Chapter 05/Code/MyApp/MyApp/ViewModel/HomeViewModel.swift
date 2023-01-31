//
//  HomeViewModel.swift
//  MyApp
//
//  Created by apple on 19/08/22.
//

import Foundation

class HomeViewModel {
    
    func logout() {
        Network.logout(id: "12345") { result in
            switch result {
            case .success(_):
                Persistence.saveLogoutState()
                Navigator.navigateToHome()
                break
            case .failure(let error):
                print(error)
            }
        }
    }
}
