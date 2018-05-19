//
//  internal class API : NSObject { API.swift
//  sayis
//
//  Created by ahmedxiio on 3/21/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class API: NSObject {
    
    //login
    class func login(phonnumber: String ,password: String,completion: @escaping (_ error :Error? ,_ success :Bool , _ json :JSON? )->Void) {
        let url = "\(apiUrl)user/signin"
        print("url" , url)
        let parameters : [String: Any] = [
            "phone": phonnumber,
            "password": password
            ]
        Alamofire.request(url, method: .post, parameters: parameters,headers: ["Accept":"Application/json"])
        .responseJSON {
            response in
            print(response)
            switch response.result {
            case .success:
                if let data = response.result.value{
                    let json = JSON(data)
                    if let status = json["status"].bool , status == true{
                        completion(nil,true,json)
                    }else{
                        completion(nil,false,json)
                    }
                }
                if response.result.error == nil {
                    guard response.data != nil else{return}
                }
            case .failure(let error):
                 completion(error, false , nil )
            }
        }
    }
    
    //register
    class func register(firstname: String ,lastname: String,phonnumber: String,mail: String,password:String,confirmpassword: String,completion: @escaping (_ error :Error? ,_ success :Bool , _ json :JSON? )->Void) {
        let url = "\(apiUrl)user/signup"
        print("url" , url)
        let parameters = [
            "first_name": firstname,
            "last_name": lastname,
            "phone": phonnumber,
            "email": mail,
            "password": password,
        ]
        Alamofire.request(url, method: .post, parameters: parameters ,headers: ["Accept":"Application/json"])
            .responseJSON { response in
                print(response)
                switch response.result {
                case .success:
                    if let data = response.result.value{
                        let json = JSON(data)
                        if let status = json["status"].bool , status == true{
                            completion(nil,true,json)
                        }else{
                            completion(nil,false,json)
                        }
                    }
                case .failure(let error):
                    print("ERROR with '\(error)")
                }
            }
        }
    
    //send Reset Password Code
    class func sendResetPasswordCode(phonnumber: String,completion: @escaping (_ error :Error? ,_ success :Bool , _ json :JSON? )->Void) {
        let url = "\(apiUrl)user/send-reset-password-code"
        print("url" , url)
        let parameters = [
            "phone": phonnumber,
            ]
        Alamofire.request(url, method: .post, parameters: parameters ,headers: ["Accept":"Application/json"])
            .responseJSON { response in
                print(response)
                switch response.result {
                case .success:
                    if let data = response.result.value{
                        let json = JSON(data)
                        if let status = json["status"].bool , status == true{
                            completion(nil,true,json)
                            
                        }else{
                            completion(nil,false,json)
                        }
                    }
                    
                case .failure(let error):
                    print("ERROR with '\(error)")
                }
        }
    }
    
    //resetPassword
    class func resetPassword(password: String,completion: @escaping (_ error :Error? ,_ success :Bool , _ json :JSON? )->Void) {
        let url = "\(apiUrl)user/reset-password?"
        print("url" , url)
        print(UserUtil.loadUser()?.phone)
        let parameters = [
            "password": password,
            "reset_password_code" : UserUtil.loadUser()?.reset_password_code ?? "",
            "phone" : UserUtil.loadUser()?.phone ?? ""
            ]
        Alamofire.request(url, method: .post, parameters: parameters ,headers: ["Accept":"Application/json"])
            .responseJSON { response in
                print(response)
                switch response.result {
                case .success:
                    if let data = response.result.value{
                        let json = JSON(data)
                        if let status = json["status"].bool , status == true{
                            completion(nil,true,json)
                        }else{
                            completion(nil,false,json)
                        }
                    }
                case .failure(let error):
                    print("ERROR with '\(error)")
                }
           }
       }
    
    class func activationCode(code:Int,completion: @escaping (_ error :Error? ,_ success :Bool , _ json :JSON? )->Void) {
        let url = "\(apiUrl)user/activate-account"
        print("url" , url)
        print(UserUtil.loadUser()?.phone as Any)
        let parameters = [
            "api_token": UserUtil.loadUser()?.api_token ?? "",
            "code" : code,
            ] as [String : Any]
        Alamofire.request(url, method: .post, parameters: parameters ,headers: ["Accept":"Application/json"])
            .responseJSON { response in
                print(response)
                switch response.result {
                case .success:
                    if let data = response.result.value{
                        let json = JSON(data)
                        if let status = json["status"].bool , status == true{
                            completion(nil,true,json)
                        }else{
                            completion(nil,false,json)
                        }
                    }
                case .failure(let error):
                    print("ERROR with '\(error)")
          }
        }
     }
  }


