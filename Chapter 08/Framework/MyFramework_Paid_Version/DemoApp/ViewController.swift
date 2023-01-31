//
//  ViewController.swift
//  DemoApp
//

import UIKit
import MyFramework

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func validateClicked(_ sender: Any) {
        
        let validator = EmailValidator(apiKey: "key")
        
        do {
            if try validator.isEmailValid(email: email.text!) {
                print("Email is valid")
            }
        } catch let emailError {
            print(emailError)
        }
    }
}

