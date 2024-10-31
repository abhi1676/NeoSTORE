//
//  RegisterViewController.swift
//  NeoSTORE
//
//  Created by Apple on 10/28/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    @IBOutlet var fisrtName: CustomTextField!
    @IBOutlet var lastName: CustomTextField!
    @IBOutlet var email: CustomTextField!
    
    @IBOutlet var passWord: CustomTextField!
    
    @IBOutlet var confirmPassword: CustomTextField!
    
    @IBOutlet var phoneNumber: CustomTextField!
    
    @IBOutlet var termAndConditionLabel: UILabel!
    
    @IBOutlet var termAndConditionButton: UIButton!
    
    @IBOutlet var btnmale: UIButton!
    
    @IBOutlet var btnFemale: UIButton!
    
    let viewmodel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:UIColor.white]
        setUpUI()
      imageSetting()
        hideKeyboardWhenTappedAround()
    }
    
    func imageSetting(){
        btnmale.setImage(UIImage.init(named: Constants.checkNo), for: .normal)
        btnmale.setImage(UIImage.init(named: Constants.checkYes), for: .selected)
        btnFemale.setImage(UIImage.init(named: Constants.checkNo), for: .normal)
        btnFemale.setImage(UIImage.init(named: Constants.checkYes), for: .selected)
        btnmale.isSelected = true
    }

    func setUpUI(){
        fisrtName.setPlaceholderText(Constants.firstname, .white)
        lastName.setPlaceholderText(Constants.lastname, .white)
        email.setPlaceholderText(Constants.email, .white)
        passWord.setPlaceholderText(Constants.password, .white)
        confirmPassword.setPlaceholderText(Constants.confirmpassword, .white)
        phoneNumber.setPlaceholderText(Constants.phonenumber, .white)
        
        fisrtName.setIcon(UIImage(named: Constants.usernameIcon) ?? UIImage())
        lastName.setIcon(UIImage(named: Constants.usernameIcon) ?? UIImage())
        
        
        passWord.setIcon(UIImage(named: Constants.passwordIcon) ?? UIImage())
        confirmPassword.setIcon(UIImage(named: Constants.passwordIcon) ?? UIImage())
        
        email.setIcon(UIImage(named: Constants.emailIcon) ?? UIImage())
        phoneNumber.setIcon(UIImage(named: Constants.phonenumberIcon) ?? UIImage())
        
        
        termAndConditionLabel.setUnderLineToLabel(termAndConditionLabel.self, "Terms & Conditions")
        
        hideNavigationBackButtton()
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
               if sender.tag == 0{
                   btnFemale.isSelected = false
                   
               }
               else{
                   btnmale.isSelected = false
               
               }
    }
    
    @IBAction func termConditionTapped(_ sender: UIButton) {
        
        termAndConditionButton.isSelected.toggle()
        
        if termAndConditionButton.isSelected {
                termAndConditionButton.setImage(UIImage(named: Constants.checkIcon), for: .normal)
            } else {
                termAndConditionButton.setImage(UIImage(named: Constants.uncheckIcon), for: .normal)
            }
        
    }
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        
        typealias t = TextfieldType

        let isNameValid = t.name(fisrtName.text ?? "").isValid
        let isPasswordValid = t.password(passWord.text ?? "").isValid
        let isPhoneNumberValid = t.phoneNumber(phoneNumber.text ?? "").isValid
        let isEmailValid = t.email(email.text ?? "").isValid
        let isPasswordMatching = passWord.text == confirmPassword.text
           
        print("Name: '\(fisrtName.text ?? "")', Valid: \(isNameValid)")
        print("Password: '\(passWord.text ?? "")', Valid: \(isPasswordValid)")
        print("Phone Number: '\(phoneNumber.text ?? "")', Valid: \(isPhoneNumberValid)")
        print("Email: '\(email.text ?? "")', Valid: \(isEmailValid)")
        
            if isNameValid && isPasswordValid && isPhoneNumberValid && isEmailValid  && isPasswordMatching{
                print("All validations passed!")
               
            } else {
                print("Validation failed.")
            }
            
        navigationController?.popViewController(animated: true)
    }
    
}
