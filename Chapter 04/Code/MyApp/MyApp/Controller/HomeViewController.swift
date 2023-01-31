//
//  HomeViewController.swift
//  MyApp
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
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


