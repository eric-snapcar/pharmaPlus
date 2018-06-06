//
//  User.swift
//  PharmaPlus
//
//  Created by Eric Hth on 04/06/2018.
//  Copyright © 2018 Eric Hth. All rights reserved.
//
import FirebaseCore
import FirebaseAuth
import Foundation
class User : NSObject {
    var id : String
    init( firebaseUser : FirebaseAuth.User){
        self.id = firebaseUser.uid
    }
}
