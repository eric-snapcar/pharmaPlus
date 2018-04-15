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
