//
//  LoginViewController.swift
//  MyApp
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var version: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        if let email = email.text, let password = password.text {
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
        } else {
            // show error msg
        }
    }
    
    func setupUI() {
        version.text = Helper.appVersion()
        Helper.roundButton(button: loginButton)
    }
}



