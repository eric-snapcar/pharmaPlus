//
//  ReferenceService.swift
//  PharmaPlus
//
//  Created by Eric Hth on 15/04/2018.
//  Copyright © 2018 Eric Hth. All rights reserved.
//

import Foundation
import FirebaseDatabase
class FirebaseService {
    class func reference() -> DatabaseReference{
        return Database.database().reference();
    }
}

extension DatabaseReference {
    func checkIfUserExist( email : String, completion: @escaping ( _ userExists: Bool ) -> Void ) -> Void {
        let ref = FirebaseService.reference()
        let usersRef = ref.child("users")
        let email = "eric_hong_2000@yahoo.fr"
        usersRef.queryOrdered(byChild: "email").queryEqual(toValue: email).observe(.value) { (snapshot) in
            if(snapshot.value != nil){
                completion(true)
            }
            else {
                completion(false)
            }
        }
    }
    
}
