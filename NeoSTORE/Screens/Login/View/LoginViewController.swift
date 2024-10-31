//
//  LoginViewController.swift
//  NeoSTORE
//
//  Created by Apple on 10/25/24.
//

import UIKit

class LoginViewController: UIViewController{
    
    @IBOutlet var userNameTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var addAccountButton: UIButton!
    
    @IBOutlet var forgotPassLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        passwordTextField.delegate = self
        userNameTextField.delegate = self
        hideKeyboardWhenTappedAround()
    }
    
  
    
    @IBAction func forgotPassWordTapped(_ sender: Any) {
//        let sb = UIStoryboard(name: "ForgotPassword", bundle: nil)
//        let forgotPassVc = sb.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as?                           ForgotPasswordViewController
//        self.navigationController?.pushViewController(forgotPassVc!, animated: true)
        navigate(storyboardName: EnumConstants.Main.rawValue , viewControllerID: EnumConstants.ForgotPasswordViewController.rawValue)
        
    }
    
    
    @IBAction func addAccountTapped(_ sender: Any) {
        navigate(storyboardName: EnumConstants.Main.rawValue, viewControllerID: EnumConstants.RegisterViewController.rawValue)
    }
    
    
    
    
    
    
    
}


extension LoginViewController : UITextFieldDelegate {
    
    func setUpUI(){
    
        userNameTextField.setIcon(UIImage(named: Constants.usernameIcon) ?? UIImage())
        passwordTextField.setIcon(UIImage(named: Constants.passwordIcon) ?? UIImage())
        
        addAccountButton.layer.borderWidth = 1.0
        addAccountButton.layer.borderColor = UIColor.black.cgColor
        
        userNameTextField.setPlaceholderText(Constants.username, .white)
        passwordTextField.setPlaceholderText(Constants.password, .white)
        
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == userNameTextField {
              userNameTextField.setPlaceholderText("", .clear)
            passwordTextField.setPlaceholderText(Constants.password, .white)
          } else if textField == passwordTextField {
              passwordTextField.setPlaceholderText("", .clear)
              userNameTextField.setPlaceholderText(Constants.username, .white)
          }
    }
    
    
    
}
