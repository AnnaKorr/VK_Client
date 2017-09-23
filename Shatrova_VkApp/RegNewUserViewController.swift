//
//  RegNewUserViewController.swift
//  Shatrova_VkApp
//
//  Created by apple on 15.09.17.
//  Copyright © 2017 Korona. All rights reserved.
//

import UIKit

class RegNewUserViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userRepeatPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func newUserSignUp(_ sender: UIButton) {
        
        let userStoresEmail = userEmailTextField.text
        let userStoresPassword = userPasswordTextField.text
        let userRepeatsPassword = userRepeatPasswordTextField.text
        
        if (userStoresEmail?.isEmpty)! || (userStoresPassword?.isEmpty)! || (userRepeatsPassword?.isEmpty)! {
                customAlert(messageDisplay: "All fields are required.")
            
        } else if userRepeatsPassword != userStoresPassword {
            customAlert(messageDisplay: "Passwords don't match.")
        }
        
        
    }
    
    
    @IBAction func iHaveAccount(_ sender: UIButton) {
    }
    
    
    func customAlert(messageDisplay: String) {
        let messageTitle = UIAlertController(title: "Alert", message: messageDisplay, preferredStyle: UIAlertControllerStyle.alert)
        let tapOkAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        messageTitle.addAction(tapOkAction)
        self.present(messageTitle, animated: true, completion: nil)
        
    }


}
