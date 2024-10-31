//
//  ForgotPasswordViewController.swift
//  NeoSTORE
//
//  Created by Apple on 10/28/24.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
     hideNavigationBackButtton()
        username.setPlaceholderText(Constants.username, .white)
        username.setIcon(UIImage(named: Constants.usernameIcon) ?? UIImage())
     
    }
    

    @IBAction func submitTapped(_ sender: Any) {
     
        self.navigationController?.popViewController(animated: true)
    }
    

}
