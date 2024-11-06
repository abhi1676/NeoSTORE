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
         setUpUI()
        imageSetting()
        hideKeyboardWhenTappedAround()
        
       
        viewmodel.onRegisterSuccess = { [weak self]  in
            DispatchQueue.main.async {
                self?.showAlert(title: Constants.registartionComplete, message: Constants.userRegistered) {
                    self?.navigationController?.popViewController(animated: true)
                }
            }
        }
        
        viewmodel.onRegisterFailure = { [weak self] errorMessage in
            DispatchQueue.main.async {
                self?.showAlert(title: Constants.error, message: Constants.validationError)
            }
        }
    }
    
    func imageSetting(){
        btnmale.setImage(UIImage.init(named: Constants.checkNo), for: .normal)
        btnmale.setImage(UIImage.init(named: Constants.checkYes), for: .selected)
        btnFemale.setImage(UIImage.init(named: Constants.checkNo), for: .normal)
        btnFemale.setImage(UIImage.init(named: Constants.checkYes), for: .selected)
        btnmale.isSelected = true
        btnFemale.isSelected = false
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
        
        
        termAndConditionLabel.setUnderLineToLabel(termAndConditionLabel.self, Constants.termsAndConditions)
        
        hideNavigationBackButtton()
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender == btnmale {
            btnmale.isSelected = true
            btnFemale.isSelected = false
        } else if sender == btnFemale {
            btnmale.isSelected = false
            btnFemale.isSelected = true
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
        
        viewmodel.validInputs(
                    firstName: fisrtName.text,
                    lastName: lastName.text,
                    email: email.text,
                    password: passWord.text,
                    confirmPassword: confirmPassword.text,
                    phoneNumber: phoneNumber.text) { [weak self] isValid, errorMsg in
                        guard let self = self else { return }
                        if isValid {
                            let gender = self.btnmale.isSelected ? Constants.male : Constants.female
                            self.registerUser(gender: gender)
                        } else {
                            print("Validation error: \(errorMsg ?? "Unknown error")")
                            self.showAlert(title: Constants.error, message: errorMsg ?? Constants.validationError)
                        }
                    }
        
        
    }
    
    private func registerUser(gender: String) {
        viewmodel.register(
            firstName: fisrtName.text ?? "",
            lastName: lastName.text ?? "",
            email: email.text ?? "",
            password: passWord.text ?? "",
            confirmPassword: confirmPassword.text ?? "",
            phoneNo: phoneNumber.text ?? "0",
            gender: gender
        )
    }

}
