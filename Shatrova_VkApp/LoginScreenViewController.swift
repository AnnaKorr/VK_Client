//
//  LoginScreenViewController.swift
//  Shatrova_VkApp
//
//  Created by apple on 14.09.17.
//  Copyright © 2017 Korona. All rights reserved.
//

import UIKit 
import VK_ios_sdk

class LoginScreenViewController: UIViewController {

    @IBOutlet weak var customScrollView: UIScrollView!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customHideKeyboard = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        customScrollView.addGestureRecognizer(customHideKeyboard)

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardShows),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardHides(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillHide,
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
    
    
    @IBAction func existUserLogIn(_ sender: UIButton) {
        let loginUserEmailTextField = userEmailTextField.text!
        let loginUserPasswordTextField = userEmailTextField.text!
        
        if (loginUserEmailTextField.isEmpty) || (loginUserPasswordTextField.isEmpty) {
            loginCustomAlert(messageDisplay: "All fields are required.")
        }
        
    }
    
    @objc func hideKeyboard() {
        self.customScrollView?.endEditing(true)
    }
    

    @IBAction func newUserSignUp(_ sender: UIButton) {
    }
    
    @objc func keyboardShows(notification: Notification) {
        let customInfo = notification.userInfo! as NSDictionary
        let keyboardSize = (customInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let customContentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0)
        
        self.customScrollView?.contentInset = customContentInsets
        customScrollView?.scrollIndicatorInsets = customContentInsets
        
    }
    
    @objc func keyboardHides(notification: Notification) {
        let customContentInsets = UIEdgeInsets()
        customScrollView?.contentInset = customContentInsets
        customScrollView?.scrollIndicatorInsets = customContentInsets
    }
    
    
    func loginCustomAlert(messageDisplay: String) {
        let loginMessageTitle = UIAlertController(title: "Alert", message: messageDisplay, preferredStyle: UIAlertControllerStyle.alert)
        let tapOkAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        loginMessageTitle.addAction(tapOkAction)
        self.present(loginMessageTitle, animated: true, completion: nil)
        
    }

    
}
