//
//  UserUtil.swift
//  sayis
//
//  Created by ahmedxiio on 3/28/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import Foundation

class UserUtil  {

    private static let UserKey = "user"
    private static func archiveUser(_ user :UserDataService) -> NSData {
        return NSKeyedArchiver.archivedData(withRootObject: user as UserDataService) as NSData
    }
    static func loadUser() -> UserDataService? {
        if let unarchivedObject = UserDefaults.standard.object(forKey: UserKey) as? Data {
            return NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? UserDataService
        }
        return nil
    }
    static func saveUser(_ user : UserDataService?) {
        let archivedObject = archiveUser(user!)
        UserDefaults.standard.set(archivedObject, forKey: UserKey)
        UserDefaults.standard.synchronize()
    }
    static func removeUser() {
        UserDefaults.standard.removeObject(forKey: UserKey)
        UserDefaults.standard.synchronize()
    }
}


