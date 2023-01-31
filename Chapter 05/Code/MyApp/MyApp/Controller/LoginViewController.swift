//
//  LoginViewController.swift
//  MyApp
//

import UIKit

class LoginViewController: UIViewController {
    
    let viewModel = LoginViewModel()
    
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
            viewModel.login(email: email, password: password)
        }
    }
    
    func setupUI() {
        version.text = Helper.appVersion()
        Helper.roundButton(button: loginButton)
    }
}



