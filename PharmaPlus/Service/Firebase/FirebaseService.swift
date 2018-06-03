//
//  ReferenceService.swift
//  PharmaPlus
//
//  Created by Eric Hth on 15/04/2018.
//  Copyright © 2018 Eric Hth. All rights reserved.
//

import Foundation
import FirebaseDatabase
import CoreLocation
class FirebaseService {
    class func reference() -> DatabaseReference{
        return Database.database().reference();
    }
    class func signIn(email:String,password:String, completion: @escaping ( _ user : User, _ error : NSError) -> Void ){
        
    }
}
extension DatabaseReference {
    func testLocationWakeup( ){
        let locationRef = self.child("testLocationWakeUp")
        let newLocationRef = locationRef.childByAutoId()
        let value = [ "timestamp":NSDate().timeIntervalSince1970] as [String : Any]
        newLocationRef.setValue(value)
    }
    
    func checkIfUserExist( email : String, completion: @escaping ( _ exists: Bool ) -> Void ) -> Void {
        let usersRef = self.child("users")
        let email = "eric_hong_2000@yahoo.fr"
        usersRef.queryOrdered(byChild: "email").queryEqual(toValue: email).observeSingleEvent(of: .value, with: { (snapshot) in
            if(snapshot.exists()){
                completion(true)
            }
            else {
                completion(false)
            }
        })
    }
    func addLocation( location : CLLocation ) -> Void {
        let locationRef = self.child("locationBackground")
        let newLocationRef = locationRef.childByAutoId()
        let value = ["coordinate":["lat":location.coordinate.latitude,"lng":location.coordinate.longitude],"coordinates":["lat":location.coordinate.latitude,"lng":location.coordinate.longitude],"timestamp":location.timestamp.timeIntervalSince1970] as [String : Any]
        newLocationRef.setValue(value)
    }
}
