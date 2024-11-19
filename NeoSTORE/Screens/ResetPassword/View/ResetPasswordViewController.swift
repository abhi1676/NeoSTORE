//
//  ResetPasswordViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/19/24.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet var oldPassword: CustomTextField!
    
    @IBOutlet var newPassword: CustomTextField!
    

    @IBOutlet var confirmNewPassword: CustomTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }
    
    func setUpUI(){
        oldPassword.setIcon(UIImage(named: Constants.passwordIcon) ?? UIImage())
        newPassword.setIcon(UIImage(named: Constants.passwordIcon) ?? UIImage())
        confirmNewPassword.setIcon(UIImage(named: Constants.passwordIcon) ?? UIImage())
        
        oldPassword.setPlaceholderText("Current Password", .white)
        newPassword.setPlaceholderText("New Password", .white)
        confirmNewPassword.setPlaceholderText("Confirm Password", .white)
        
    }
    

}
