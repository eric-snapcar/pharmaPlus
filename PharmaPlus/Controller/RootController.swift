//
//  ViewController.swift
//  PharmaPlus
//
//  Created by Eric Hth on 05/04/2018.
//  Copyright © 2018 Eric Hth. All rights reserved.
//

import UIKit
import FirebaseDatabase
import CoreLocation
class RootController: UIViewController{
    // MARK: private var
    var loginController = LoginController()
    var mainController = MainController()
    // MARK: UIViewController override
    override func viewDidLoad() {
        super.viewDidLoad()
        let email = "eric_hong_2000@yahoo.fr"
        FirebaseService.reference().checkIfUserExist(email: email) { (exists) in
            print("User Exists")
            print(exists)
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        if(UserDefaultsService.authOk()){
            self.present(mainController, animated: false) {
            }
        }else{
            self.present(loginController, animated: false) {
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

