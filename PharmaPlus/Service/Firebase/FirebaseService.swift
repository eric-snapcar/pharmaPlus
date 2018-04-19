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
}
extension DatabaseReference {
    func testLocationWakeup( ){
        let locationRef = self.child("testLocationWakeUp")
        let newLocationRef = locationRef.childByAutoId()
        let value = [ "timestamp":NSDate().timeIntervalSince1970] as [String : Any]
        newLocationRef.setValue(value)
    }
    func addLocation( location : CLLocation ) -> Void {
        let locationRef = self.child("location")
        let newLocationRef = locationRef.childByAutoId()
        let value = ["coordinate":["lat":location.coordinate.latitude,"lng":location.coordinate.longitude],"timestamp":location.timestamp.timeIntervalSince1970] as [String : Any]
        newLocationRef.setValue(value)
    }
}
