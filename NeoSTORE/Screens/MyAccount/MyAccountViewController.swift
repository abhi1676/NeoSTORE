//
//  MyAccountViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/18/24.
//

import UIKit

class MyAccountViewController: UIViewController {

    @IBOutlet var accountImg: UIImageView!
    
    @IBOutlet var firstName: CustomTextField!
    
    @IBOutlet var lastName: CustomTextField!
    
    @IBOutlet var email: CustomTextField!
    
    @IBOutlet var phoneNumber: CustomTextField!
    
    @IBOutlet var DOB: CustomTextField!
    var viewModel = MyAccountViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        hideKeyboardWhenTappedAround()
        bindViewModel()
        viewModel.fetchUserDetails()
    }
    
    func setUpUI(){
        accountImg.clipsToBounds = true
        accountImg.layer.cornerRadius = accountImg.frame.width/2
        accountImg.layer.borderColor = UIColor.black.cgColor
        accountImg.layer.borderWidth = 0.5
        self.navigationController?.navigationBar.topItem?.title = ""
        accountImg.clipsToBounds = true
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


    }
    
    func bindViewModel() {
        viewModel.eventHandler = { [weak self] event in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch event {
                case .loading:
                    
                    print("Loading user details...")
                case .dataLoaded:
                    
                    self.updateUI()
                case .error(let error):
                    print(error)
                case .stopLoading:
                    print("Stopped loading")
                }
            }
        }
    }
    
    func updateUI() {
            guard let userDetails = viewModel.userDetails else { return }
            
            firstName.text = userDetails.first_name
            lastName.text = userDetails.last_name
            email.text = userDetails.email
            phoneNumber.text = "\(userDetails.phone_no ?? "0")"
            DOB.text = userDetails.dob
        
        }
        
    @IBAction func editButtonTapped(_ sender: Any) {
        navigate(storyboardName: "AccountScreen", viewControllerID: "EditProfileViewController")
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
    }
}
