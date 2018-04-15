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
        let ref = FirebaseService.reference()
        let usersRef = ref.child("users")
        let email = "eric_hong_2000@yahoo.fr"
        usersRef.queryOrdered(byChild: "email").queryEqual(toValue: email).observe(.value) { (snapshot) in
            print("new")
            print(snapshot)
        }
        usersRef.queryOrdered(byChild: "email").queryEqual(toValue: email, childKey: "testId").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            print(snapshot)
            print(value as Any)
        }) { (error) in
            print(error.localizedDescription)
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

