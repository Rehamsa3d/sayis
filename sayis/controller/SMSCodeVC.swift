//
//  SMSCodeViewController.swift
//  sayis
//
//  Created by ahmedxiio on 3/20/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit

class SMSCodeVC: UIViewController {
   
    //Mark: properties
    @IBOutlet weak var smsCodeFirstNum: UITextField!
    @IBOutlet weak var smsCodeSocendNum: UITextField!
    @IBOutlet weak var smsCodeThirdNum: UITextField!
    @IBOutlet weak var smsCodeForthNum: UITextField!
    
    var pageType: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
//        print("pageType" , pageType)
    }
    @IBAction func loginbackbutton(_ sender: UIButton) {
//    self.navigationController?.popViewController(animated: true)
        let signInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signInVC")
        self.present(signInVC, animated: true, completion: nil)
    }
 
    @IBAction func sendSMSCodeAgain(_ sender: UIButton) {
        
    }
    @IBAction func activateButtonTaped(_ sender: Any) {
        if pageType == "resetPassword"{
            setCodeToReestPassword()
        }else{
            setActivationCode()
        }
    }
    
    //Mark: set Activation Code function
    func setActivationCode()  {
        let activationCode = smsCodeFirstNum.text! + smsCodeSocendNum.text! + smsCodeThirdNum.text! + smsCodeForthNum.text!
        
//        (UserUtil.loadUser()?.activation)!
       
        let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeVC") as! HomeVC
        print("activationCode" , activationCode)
        if activationCode == "\(UserUtil.loadUser()?.activation ?? 0)" {
            API.activationCode(code: Int(activationCode )!) { (error, isSuccess, json) in
                if isSuccess {
                    let user = UserDataService(json!["data"])
                    UserUtil.saveUser(user)
                    self.present(homeVC, animated: true, completion: nil)

                }else{
                    print("error login")
                }
            }
        }else{
            self.messageToDisplay(messageToDisplay: "faild to activite")
        }
    }
    
    //Mark: set Reest Password Code function
    func setCodeToReestPassword()  {
        let reset_password_code = smsCodeFirstNum.text! + smsCodeSocendNum.text! + smsCodeThirdNum.text! + smsCodeForthNum.text!
        
        
        let resetPasswordVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "resetPasswordVC") as! ResetPasswordVC
        print("UserUtil.loadUser()?.reset_password_code" , UserUtil.loadUser()?.reset_password_code as Any)
        print("reset_password_code" , reset_password_code)

        if reset_password_code == UserUtil.loadUser()?.reset_password_code {
            self.present(resetPasswordVC, animated: true, completion: nil)
        }else{
            self.messageToDisplay(messageToDisplay: "Incorrect Code")
        }
    }
    
}
