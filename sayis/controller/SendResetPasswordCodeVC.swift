//
//  forgetpasswordViewController.swift
//  sayis
//
//  Created by ahmedxiio on 3/20/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit

class SendResetPasswordCodeVC: UIViewController {
    // Mark: properties
    @IBOutlet weak var resetPHonTextFeld: SayesTexField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    @IBAction func closeButton(_ sender: UIButton) {
//        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func sendResetEmailTaped(_ sender: Any) {
        sendResetEmail()
    }

    func sendResetEmail()  {
        guard  let resetPHonTextFeld = resetPHonTextFeld.text?.trimmed, !resetPHonTextFeld.isEmpty
            else {messageToDisplay(messageToDisplay: "mail is not valid");return}
        print("resetEmail \(String(describing: resetPHonTextFeld))")
        //
        API.sendResetPasswordCode( phonnumber: resetPHonTextFeld) { (error, isSuccess , json) in
            if isSuccess {
                let user = UserDataService(json!["data"])
//                print("user ===>>>" , user.api_token)
                UserUtil.saveUser(user)
                let SMSCodeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SMSCodeVC") as! SMSCodeVC
                SMSCodeVC.pageType = "resetPassword"
                self.present(SMSCodeVC, animated: true, completion: nil)
                
            }else{
                print("error login")
                if let phoneMsg = json?["phone"][0].string {
                    self.messageToDisplay(messageToDisplay:phoneMsg)
                }
            }
        }
        
    }
    
    
}
