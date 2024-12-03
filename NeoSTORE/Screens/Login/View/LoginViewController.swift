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
    
    private var viewModel = LoginViewModel(apiManager: APIManager.shared)
    
    @IBOutlet var LoadingView: UIView!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadingView.alpha = 0
        LoadingView.backgroundColor = .systemRed
       
        setUpUI()
        passwordTextField.delegate = self
        userNameTextField.delegate = self
        hideKeyboardWhenTappedAround()
        setUpBindings()
        
//        userNameTextField.text = "Abhi2@gmail.com"
//        passwordTextField.text = "Abhi@123"
        userNameTextField.text = "Dummy123@gmail.com"
        passwordTextField.text = "Dummy@123"
        
    }
    
    private func  setUpBindings(){
        
        viewModel.onLoginSuccess = {
            [weak self] in
            DispatchQueue.main.async {
                self?.LoadingView.alpha = 0
                self?.activityIndicator.stopAnimating()
                    self?.navigate(storyboardName: EnumConstants.HomeScreen.rawValue, viewControllerID: EnumConstants.HomeScreenViewController.rawValue)
                }
            }
        
        
        viewModel.onLoginFailure = {
            
            [weak self] errorMsg in
            DispatchQueue.main.async {
                
                self?.showAlert(title: Constants.loginFailed, message:errorMsg )
            }
        }
        
    }
  
    
    @IBAction func forgotPassWordTapped(_ sender: Any) {
//        let sb = UIStoryboard(name: "ForgotPassword", bundle: nil)
//        let forgotPassVc = sb.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as?                           ForgotPasswordViewController
//        self.navigationController?.pushViewController(forgotPassVc!, animated: true)
        
//        showAlert(title: "FORGOT PASSWORD", message: "NAVIGATING TO FOGOT PASSWORD PAGE",completion: {
//            self.navigate(storyboardName: EnumConstants.Main.rawValue , viewControllerID: EnumConstants.ForgotPasswordViewController.rawValue)
//        })
        navigate(storyboardName: EnumConstants.Main.rawValue , viewControllerID: EnumConstants.ForgotPasswordViewController.rawValue)
        
        
    }
    
    
    @IBAction func addAccountTapped(_ sender: Any) {
        navigate(storyboardName: EnumConstants.Main.rawValue, viewControllerID: EnumConstants.RegisterViewController.rawValue)
    }
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        LoadingView.alpha = 0.5
        activityIndicator.startAnimating()
        viewModel.login(email: userNameTextField.text ?? "", password: passwordTextField.text ?? "")
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
