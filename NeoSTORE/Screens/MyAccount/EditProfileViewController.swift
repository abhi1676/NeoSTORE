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
    
    var viewModel = EditProfileViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

hideKeyboardWhenTappedAround()
        
        setUpBinding()
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


    func setUpBinding() {
        viewModel.eventHandler = { [weak self] event in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch event {
                case .loading:
           
                    print("Loading user details...")
                case .dataLoaded:
              
                    print("User details loaded successfully!")
                    self.setUpUI()
                case .error(let error):
                   
                    print("An error occurred : \(error?.localizedDescription ?? "")")
                   
                case .stopLoading:
               
                    print("Stopped loading")
                   
                }
            }
        }
    }


    @IBAction func submitButtonTapped(_ sender: Any) {
        guard let firstName = firstName.text, !firstName.isEmpty,
                  let lastName = lastName.text, !lastName.isEmpty,
                  let email = email.text, !email.isEmpty,
                  let dob = DOB.text, !dob.isEmpty,
                  let phoneNo = phoneNumber.text, !phoneNo.isEmpty else {
                
                      showAlert(title: "Error", message: "All Fields Are Required")
                      return
            }
            
            let requestModel = EditProfileRequest(first_name: firstName, last_name: lastName, email: email, dob: dob, profile_pic: "", phone_no: phoneNo)
            
            viewModel.updateProfile(requestModel: requestModel)
        
        
    }
    }

