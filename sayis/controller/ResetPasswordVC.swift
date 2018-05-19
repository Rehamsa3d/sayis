//
//  resetPasswordVC.swift
//  sayis
//
//  Created by ahmedxiio on 4/1/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit

class ResetPasswordVC: UIViewController {

    var pageType: String?
    
    @IBOutlet weak var newPassWordTextFeild: SayesTexField!
    @IBOutlet weak var confirmNewPassWordTextFeild: SayesTexField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func SetNewPassWordButtonTapped(_ sender: Any) {
        ResetPassword()
    }
    //Set New PassWord function
    func ResetPassword()  {
        guard let password = newPassWordTextFeild.text?.trimmed, !password.isEmpty,password.isValidPassword
            else {messageToDisplay(messageToDisplay: "password is not valid");return}
        guard let confirmpassword = confirmNewPassWordTextFeild.text?.trimmed, !confirmpassword.isEmpty
            else {messageToDisplay(messageToDisplay: "password is not valid");return}
        guard password == confirmpassword
            else {messageToDisplay(messageToDisplay: "password is not matched");return}

        API.resetPassword(password: password) { (error, isSuccess , json) in
            if isSuccess {
                let user = UserDataService(json!["data"])
                UserUtil.saveUser(user)
                self.checkActivationCode()
            }else{
                print("error login")
            }
        }
    }

}
