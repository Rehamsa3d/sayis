//
//  AppDelegate.swift
//  sayis
//
//  Created by ahmedxiio on 3/18/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        checkUser()
//        UserUtil.saveUser(U)

        // APIKey for Google Maps
        GMSServices.provideAPIKey("AIzaSyBB8AqrcYSj-ITd_-a1rkKCHbRrKSQYY-Y")
        GMSPlacesClient.provideAPIKey("AIzaSyBB8AqrcYSj-ITd_-a1rkKCHbRrKSQYY-Y")
        //UserUtil.removeUser()
        return true
    }
    func checkUser() {
        print(UserUtil.loadUser()?.activation)
        if UserUtil.loadUser()?.activation == 1{
            let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeVC")
            let navigationController = UINavigationController(rootViewController: homeVC)
            self.window?.rootViewController = navigationController
            self.window!.makeKeyAndVisible()
        }else{
            let signInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signInVC")
            let navigationController = UINavigationController(rootViewController: signInVC)
            self.window?.rootViewController = navigationController
            self.window!.makeKeyAndVisible()
        }
    }
}

