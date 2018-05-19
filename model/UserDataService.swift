//
//  userDefualts.swift
//  sayis
//
//  Created by ahmedxiio on 3/27/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import Foundation
import SwiftyJSON
class UserDataService : NSObject , NSCoding{
//    static let instance = userDataService()
    var id:Int?
    var first_name :String?
    var last_name :String?
    var email :String?
    var phone :String?
    var experience :String?
    var nid :String?
    var temp_phone :String?
    var reset_phone_code :String?
    var license_expiry_date :String?
    var license_image :String?
    var activation :Int?
    var available :String?
    var image :String?
    var reset_password_code :String?
    var api_token :String?
    var mobile_token :String?
    var country_id :Int?
    var created_at :String?
    var updated_at :String?
    var car_info :String?
    var points :String?
    var trips_count :String?
    var country :String?
    
    required init(_ data:JSON) {
        self.id = data["id"].int
        self.first_name = data["first_name"].string
        self.last_name = data["last_name"].string
        self.email = data["email"].string
        self.phone = data["phone"].string
        self.experience = data["experience"].string
        self.nid = data["nid"].string
        self.temp_phone = data["temp_phone"].string
        self.reset_phone_code = data["reset_phone_code"].string
        self.license_expiry_date = data["license_expiry_date"].string
        self.license_image = data["license_image"].string
        self.activation = data["activation"].int
        self.available = data["available"].string
        self.image = data["image"].string
        self.reset_password_code = data["reset_password_code"].string
        self.api_token = data["api_token"].string
        self.mobile_token = data["mobile_token"].string
        self.country_id = data["country_id"].int
        self.created_at = data["created_at"].string
        self.car_info = data["car_info"].string
        self.points = data["points"].string
        self.trips_count = data["trips_count"].string
        self.country = data["country"].string
    }

    
    required init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "id") as? Int
        self.first_name = aDecoder.decodeObject(forKey: "first_name") as? String
        self.last_name = aDecoder.decodeObject(forKey: "last_name") as? String
        self.email = aDecoder.decodeObject(forKey: "email") as? String
        self.phone = aDecoder.decodeObject(forKey: "phone") as? String
        self.experience = aDecoder.decodeObject(forKey: "experience") as? String
        self.nid = aDecoder.decodeObject(forKey: "nid") as? String
        self.temp_phone = aDecoder.decodeObject(forKey: "temp_phone") as? String
        self.reset_phone_code = aDecoder.decodeObject(forKey: "reset_phone_code") as? String
        self.license_expiry_date = aDecoder.decodeObject(forKey: "license_expiry_date") as? String
        self.license_image = aDecoder.decodeObject(forKey: "license_image") as? String
        self.activation = aDecoder.decodeObject(forKey: "activation") as? Int
        self.available = aDecoder.decodeObject(forKey: "available") as? String
        self.image = aDecoder.decodeObject(forKey: "image") as? String
        self.reset_password_code = aDecoder.decodeObject(forKey: "reset_password_code") as? String
        self.api_token = aDecoder.decodeObject(forKey: "api_token") as? String
        self.mobile_token = aDecoder.decodeObject(forKey: "mobile_token") as? String
        self.country_id = aDecoder.decodeObject(forKey: "country_id") as? Int
        self.car_info = aDecoder.decodeObject(forKey: "car_info") as? String
        self.points = aDecoder.decodeObject(forKey: "points") as? String
        self.trips_count = aDecoder.decodeObject(forKey: "trips_count") as? String
        self.country = aDecoder.decodeObject(forKey: "country") as? String

    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(first_name, forKey: "first_name")
        aCoder.encode(last_name, forKey: "last_name")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(phone, forKey: "phone")
        aCoder.encode(experience, forKey: "experience")
        aCoder.encode(temp_phone, forKey: "temp_phone")
        aCoder.encode(reset_phone_code, forKey: "reset_phone_code")
        aCoder.encode(license_expiry_date, forKey: "license_expiry_date")
        aCoder.encode(license_image, forKey: "license_image")
        aCoder.encode(activation, forKey: "activation")
        aCoder.encode(available, forKey: "available")
        aCoder.encode(image, forKey: "image")
        aCoder.encode(reset_password_code, forKey: "reset_password_code")
        aCoder.encode(api_token, forKey: "api_token")
        aCoder.encode(mobile_token, forKey: "mobile_token")
        aCoder.encode(country_id, forKey: "country_id")
        aCoder.encode(car_info, forKey: "car_info")
        aCoder.encode(points, forKey: "points")
        aCoder.encode(trips_count, forKey: "trips_count")
        aCoder.encode(country, forKey: "c")
    }

}

