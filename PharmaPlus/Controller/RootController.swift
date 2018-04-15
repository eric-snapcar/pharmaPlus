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
        var ref: DatabaseReference!
        ref = Database.database().reference()

    }
    override func viewDidAppear(_ animated: Bool) {
        self.present(mainController, animated: false) {
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

