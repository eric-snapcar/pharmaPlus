//
//  CacheService.swift
//  PharmaPlus
//
//  Created by Eric Hth on 15/04/2018.
//  Copyright © 2018 Eric Hth. All rights reserved.
//

import Foundation
class CacheService {
    class func authOk() -> Bool{
        return true;
    }
}
// CACHE EMAIL
// CACHE PHOTO POST ID

/*
fileprivate class func save(_ value:AnyObject,key:SCServiceCacheValue){
    let defaults = UserDefaults.standard
    defaults.setValue(value, forKey: key.rawValue)
    defaults.synchronize()
}
fileprivate class func get(_ key:SCServiceCacheValue) -> String?{
    let defaults = UserDefaults.standard
    return defaults.string(forKey: key.rawValue)
}
fileprivate class func getInt(_ key:SCServiceCacheValue) -> Int?{
    let defaults = UserDefaults.standard
    return defaults.integer(forKey: key.rawValue)
}
fileprivate class func getBool(_ key:SCServiceCacheValue) -> Bool?{
    let defaults = UserDefaults.standard
    return defaults.bool(forKey: key.rawValue)
}
fileprivate class func delete(_ key:SCServiceCacheValue) {
    let defaults = UserDefaults.standard
    defaults.removeObject(forKey: key.rawValue)
    defaults.synchronize()
}
 */
 
