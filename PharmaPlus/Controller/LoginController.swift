//
//  LoginController.swift
//  PharmaPlus
//
//  Created by Eric Hth on 15/04/2018.
//  Copyright © 2018 Eric Hth. All rights reserved.
//

import UIKit
class LoginController : UIViewController {
    // MARK: @IBOutle
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func onTapLoginButton(_ sender: Any) {
        print("onTapLoginButton")
        print(emailTextField.text)
    }
    
}
