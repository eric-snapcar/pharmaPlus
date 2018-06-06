//
//  ReferenceService.swift
//  PharmaPlus
//
//  Created by Eric Hth on 15/04/2018.
//  Copyright © 2018 Eric Hth. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth
import CoreLocation
class FirebaseService {
    class func reference() -> DatabaseReference{
        return Database.database().reference();
    }
    class func signIn(email:String,password:String, completion: @escaping ( _ user : User?, _ error : Error?) -> Void ){
        Auth.auth().signIn(withEmail: "eric_hong_2000@yahoo.fr", password: "karpov") { (firebaseUser, error) in
            completion(User(firebaseUser:firebaseUser),error)
        }
    }
    class func observeAuth(completion: @escaping ( _ user : User? ) -> Void ){
        let handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if(auth.currentUser == nil){
                completion(nil)
            }else {
                completion(User(firebaseUser:auth.currentUser));
            }
        }
    }
    class func createUser(userId: String, completion: @escaping ( _ user : User?, _ error : Error?) -> Void  ){
        let usersRef = reference().child("users")
        usersRef.child(userId).setValue(["confirmed":false]){ (error,ref) -> Void in
            print(error)
            print(ref)
        }
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
