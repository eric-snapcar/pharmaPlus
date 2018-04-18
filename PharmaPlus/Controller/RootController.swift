//
//  ViewController.swift
//  PharmaPlus
//
//  Created by Eric Hth on 05/04/2018.
//  Copyright © 2018 Eric Hth. All rights reserved.
//

import UIKit
import CoreLocation
import FirebaseDatabase
class RootController: UIViewController , CLLocationManagerDelegate{
    // MARK: private var
    var loginController = LoginController()
    var mainController = MainController()
    var locationManager = CLLocationManager()
    // MARK: CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for location in locations{
            FirebaseService.reference().addLocation(location:location);
        }
    }
    // MARK: UIViewController override
    override func viewDidLoad() {
        super.viewDidLoad()
        // TEST FIREBASE
        let email = "eric_hong_2000@yahoo.fr"
        FirebaseService.reference().checkIfUserExist(email: email) { (exists) in
            print("User Exists")
            print(exists)
        }
        // END
        

        // LOCALIZATION
        print("CLLocationManager.locationServicesEnabled()")
        print(CLLocationManager.locationServicesEnabled())
        print(CLLocationManager.authorizationStatus().rawValue)
        locationManager.requestAlwaysAuthorization()
        if(CLLocationManager.locationServicesEnabled()){
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
            locationManager.distanceFilter = 500
        }

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

