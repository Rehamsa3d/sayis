//
//  signupViewController.swift
//  sayis
//
//  Created by ahmedxiio on 3/19/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    // Mark: properties
    
    //Mark: SayesTexField
    @IBOutlet weak var FirstNameTextField: SayesTexField!
    @IBOutlet weak var SecondNameTextField: SayesTexField!
    @IBOutlet weak var PhonNumberTextField: SayesTexField!
    @IBOutlet weak var MailTextField: SayesTexField!
    @IBOutlet weak var PasswordTextField: SayesTexField!
    @IBOutlet weak var ConfirmPasswordTextField: SayesTexField!
    
    //Mark: SayesUIButton
    @IBOutlet weak var signupbutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    //Mark: DismissButtonAction
    @IBAction func loginbackbutton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    //Mark: LoginButtonAction
    @IBAction func LoginButtonAction(_ sender: UIButton) {
        //sinUp function calling
        sinUp()
      }
    
     //sinUp function
    func sinUp()  {
        //API.validat
        guard let firstname = FirstNameTextField.text?.trimmed, !firstname.isEmpty
            else {messageToDisplay(messageToDisplay: "firstname is empty");return}
        
        guard  let lastname = SecondNameTextField.text?.trimmed, !lastname.isEmpty
            else {messageToDisplay(messageToDisplay: "lastname is empty");return}
        
        guard  let phonnumber = PhonNumberTextField.text?.trimmed, !phonnumber.isEmpty,phonnumber.isPhonNumber
            else {messageToDisplay(messageToDisplay: "phonnumber is not valid");return}
        
        guard  let mail = MailTextField.text?.trimmed, !mail.isEmpty,mail.isEmail
            else {messageToDisplay(messageToDisplay: "mail is not valid");return}
        
        guard let password = PasswordTextField.text?.trimmed, !password.isEmpty,password.isValidPassword
            else {messageToDisplay(messageToDisplay: "password is not valid");return}
        
        guard let confirmpassword = ConfirmPasswordTextField.text?.trimmed, !confirmpassword.isEmpty
            else {messageToDisplay(messageToDisplay: "password is not valid");return}
        
        guard password == confirmpassword
            else {messageToDisplay(messageToDisplay: "password is not matched");return}
        
        //API.register
        API.register(firstname: firstname, lastname: lastname, phonnumber: phonnumber, mail: mail, password: password, confirmpassword: confirmpassword) { (error, isSuccess , json ) in
            if isSuccess {
                let user = UserDataService(json!["data"])
                UserUtil.saveUser(user)
                let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SMSCodeVC") as! SMSCodeVC
                homeVC.pageType = "signup"
                self.present(homeVC, animated: true, completion: nil)
                self.messageToDisplay(messageToDisplay: "succfully signup")
            }else{
                if let FirstNameMsg = json?["first_name"][0].string {
                    self.messageToDisplay(messageToDisplay:FirstNameMsg)
                }
                if let lastNameMsg = json?["last_name"][0].string {
                    self.messageToDisplay(messageToDisplay:lastNameMsg)
                }
                if let phoneMsg = json?["phone"][0].string {
                    self.messageToDisplay(messageToDisplay:phoneMsg)
                }
                if let emailMsg = json?["email"][0].string {
                    self.messageToDisplay(messageToDisplay:emailMsg)
                }
                if let passwordMsg = json?["password"][0].string {
                    self.messageToDisplay(messageToDisplay:passwordMsg)
                }
                
            }
        }
    }
}
