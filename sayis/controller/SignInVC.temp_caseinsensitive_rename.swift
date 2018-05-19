//
//  ViewController.swift
//  sayis
//
//  Created by ahmedxiio on 3/18/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    
    // Mark: properties
    @IBOutlet weak var phonNumbertext: SayesTexField!
    @IBOutlet weak var passwordtextfeldrounded: SayesTexField!
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // Mark: Actions
    @IBAction func loginButton(_ sender: SayisButton) {
        
        login()
    }
    
    // Mark: login function
    func login()  {
        
        guard let phonnumber = phonNumbertext.text?.trimmed, !phonnumber.isEmpty,phonnumber.isPhonNumber
            else{messageToDisplay(messageToDisplay: "phone number is empty");return}
        
        guard let password = passwordtextfeldrounded.text?.trimmed, !password.isEmpty
            else{messageToDisplay(messageToDisplay: "password is empty");return}
        
        print(phonnumber , " " , password , " ")
        API.login( phonnumber: phonnumber,password: password) { (error, isSuccess , json) in
            if isSuccess {
                let user = UserDataService(json!["data"])
//                print("user ===>>>" , user.api_token)
                UserUtil.saveUser(user)
                self.checkActivationCode()
            }else{
                print("error login")
                if let phoneMsg = json?["phone"][0].string {
                    self.messageToDisplay(messageToDisplay:phoneMsg)
                }
                if let passwordMsg = json?["password"][0].string {
                    self.messageToDisplay(messageToDisplay:passwordMsg)
                }
                if let messageMsg = json?["data"]["message"].string {
                    self.messageToDisplay(messageToDisplay:messageMsg)
                }
            }
        }

    }
}





