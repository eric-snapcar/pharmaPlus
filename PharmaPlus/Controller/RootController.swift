//
//  ViewController.swift
//  PharmaPlus
//
//  Created by Eric Hth on 05/04/2018.
//  Copyright © 2018 Eric Hth. All rights reserved.
//

import UIKit
import FirebaseDatabase
class RootController: UIViewController {
    var loginController = LoginController()
    var mainController = MainController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // TEST FIREBASE
        let email = "eric_hong_2000@yahoo.fr"
        FirebaseService.reference().checkIfUserExist(email: email) { (exists) in
            print("User Exists")
            print(exists)
        }
        // END
    }
    override func viewDidAppear(_ animated: Bool) {
        if(CacheService.authOk()){
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

