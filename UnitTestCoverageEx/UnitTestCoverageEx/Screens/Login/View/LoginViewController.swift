//
//  ViewController.swift
//  UnitTestCoverageEx
//
//  Created by Anand Yadav on 28-05-2024.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField:UITextField!
    @IBOutlet weak var passwordField:UITextField!
    private let viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func loginButtonPressed(_ sender: Any) {
        let result = viewModel.validateLoginCredentials(emailField.text, password: passwordField.text)
        showAlert(result.rawValue)
    }
    
    
}

