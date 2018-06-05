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
        FirebaseService.observeAuth { (user) in
            if(user != nil){
                self.show(viewController:self.mainController, animated: false, completion: {
                    
                })
            }else {
                self.show(viewController:self.loginController, animated: false, completion: {
                    
                })
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
 
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

