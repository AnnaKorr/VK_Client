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
    @IBOutlet weak var regScrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let regHideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(self.regKeyboardHide))
        regScrollView?.addGestureRecognizer(regHideKeyboardGesture)
        
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(regKeyboardShows),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(regKeyboardHides(notification:)), name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.UIKeyboardWillShow,
                                                  object: nil)
        
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.UIKeyboardWillHide,
                                                  object: nil)
        
    }
    
    
    func customAlert(messageDisplay: String) {
        let messageTitle = UIAlertController(title: "Alert", message: messageDisplay, preferredStyle: UIAlertControllerStyle.alert)
        let tapOkAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        messageTitle.addAction(tapOkAction)
        self.present(messageTitle, animated: true, completion: nil)
        
    }
    
    
    @objc func regKeyboardHide() {
        self.regScrollView?.endEditing(true)
    }

  
    @objc func regKeyboardShows(notification: Notification) {
        let regCustomInfo = notification.userInfo! as NSDictionary
        let regKeyBoardSize = (regCustomInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let regCustomContentInsets = UIEdgeInsetsMake(0.0, 0.0, regKeyBoardSize.height, 0.0)
        
        self.regScrollView?.contentInset = regCustomContentInsets
        regScrollView?.scrollIndicatorInsets = regCustomContentInsets
        
    }
    
    
    @objc func regKeyboardHides(notification: Notification) {
        let regCustomContentInsets = UIEdgeInsets()
        regScrollView?.contentInset = regCustomContentInsets
        regScrollView?.scrollIndicatorInsets = regCustomContentInsets
    }
    
    
    @IBAction func iHaveAccount(_ sender: UIButton) {
    }
}
