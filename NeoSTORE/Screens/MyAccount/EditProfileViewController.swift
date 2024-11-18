//
//  EditProfileViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/18/24.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet var firstName: CustomTextField!
   
    @IBOutlet var lastName: CustomTextField!
    
    @IBOutlet var email: CustomTextField!
    
    @IBOutlet var phoneNumber: CustomTextField!
    
    @IBOutlet var DOB: CustomTextField!
    
    @IBOutlet var accountImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

hideKeyboardWhenTappedAround()
        
    }
    
    func setUpUI(){
        accountImg.clipsToBounds = true
        accountImg.layer.cornerRadius = accountImg.frame.width/2
        accountImg.layer.borderColor = UIColor.black.cgColor
        accountImg.layer.borderWidth = 0.5
    
        firstName.setPlaceholderText(Constants.firstname, .white)
        lastName.setPlaceholderText(Constants.lastname, .white)
        email.setPlaceholderText(Constants.email, .white)
        DOB.setPlaceholderText("DOB", .white)
        phoneNumber.setPlaceholderText(Constants.phonenumber, .white)
        
        lastName.setIcon(UIImage(named: Constants.usernameIcon) ?? UIImage())
        firstName.setIcon(UIImage(named: Constants.usernameIcon) ?? UIImage())
        email.setIcon(UIImage(named: Constants.emailIcon) ?? UIImage())
        DOB.setIcon(UIImage(named: "dob_icon") ?? UIImage())
        phoneNumber.setIcon(UIImage(named: Constants.phonenumberIcon) ?? UIImage())
        
        
        
        
        lastName.setIcon(UIImage(named: Constants.usernameIcon) ?? UIImage())
        firstName.setIcon(UIImage(named: Constants.usernameIcon) ?? UIImage())
        email.setIcon(UIImage(named: Constants.emailIcon) ?? UIImage())
        DOB.setIcon(UIImage(named: "dob_icon") ?? UIImage())
        phoneNumber.setIcon(UIImage(named: Constants.phonenumberIcon) ?? UIImage())
    }
   

}
