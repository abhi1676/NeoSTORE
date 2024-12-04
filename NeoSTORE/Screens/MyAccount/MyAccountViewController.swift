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
    
    @IBOutlet var shimmerView: UIView!
    
    
    @IBOutlet var DOB: CustomTextField!
   private lazy var viewModel = MyAccountViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shimmerView.isShimmering = true
        setUpUI()
        hideKeyboardWhenTappedAround()
        bindViewModel()
        viewModel.fetchUserDetails()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.title = "MY ACCOUNT"
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
        if let imageData = UserDefaults.standard.data(forKey: "profileImage") {
            accountImg.image = UIImage(data: imageData)
        } else {
            print("No image found in UserDefaults")
        }
        
        lastName.setIcon(UIImage(named: Constants.usernameIcon) ?? UIImage())
        firstName.setIcon(UIImage(named: Constants.usernameIcon) ?? UIImage())
        email.setIcon(UIImage(named: Constants.emailIcon) ?? UIImage())
        DOB.setIcon(UIImage(named: "dob_icon") ?? UIImage())
        phoneNumber.setIcon(UIImage(named: Constants.phonenumberIcon) ?? UIImage())

        self.navigationController?.navigationBar.isHidden = false
    }
    
    func bindViewModel() {
        viewModel.eventHandler = { [weak self] event in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch event {
                    
                case .loading:
                    self.shimmerView.isHidden = false
                    self.shimmerView.startShimmering()
                  
                    print("Loading user details...")
                case .dataLoaded:
                    self.shimmerView.stopShimmering()
                    DispatchQueue.main.async {
                        self.shimmerView.isHidden = true
                    }
                  

                    self.updateUI()
                case .error(let error):
                    print(error)
                case .stopLoading:
                    self.shimmerView.stopShimmering()
                    DispatchQueue.main.async {
                        self.shimmerView.isHidden = true
                    }
              

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
        navigate(storyboardName: Constants.AccountScreen, viewControllerID: Constants.editProfileViewController)
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        navigate(storyboardName: Constants.AccountScreen, viewControllerID: Constants.resetPasswordViewController)
    }
    
    
    
}
