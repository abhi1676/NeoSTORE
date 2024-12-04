//
//  EditProfileViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/18/24.
//

import UIKit

class EditProfileViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var firstName: CustomTextField!
   
    @IBOutlet var lastName: CustomTextField!
    
    @IBOutlet var email: CustomTextField!
    
    @IBOutlet var phoneNumber: CustomTextField!
    
    @IBOutlet var DOB: CustomTextField!
    
    @IBOutlet var accountImg: UIImageView!
    
    var viewModel = EditProfileViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "EDIT PROFILE"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1.0, green: 0.149, blue: 0.0, alpha: 1.0)

hideKeyboardWhenTappedAround()
        setUpUI()
        setUpBinding()
    }
    
    func setUpUI(){
        accountImg.clipsToBounds = true
        accountImg.layer.cornerRadius = accountImg.frame.width/2
        accountImg.layer.borderColor = UIColor.black.cgColor
        accountImg.layer.borderWidth = 0.5
        if let imageData = UserDefaults.standard.data(forKey: "profileImage") {
            accountImg.image = UIImage(data: imageData)
        } else {
            print("No image found in UserDefaults")
        }
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
    
    @IBAction func uploadImageTapped(_ sender: Any) {
        presentImagePickerActionSheet()
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
        showAlert(title: "UPDATED", message: "PROFILE DATA UPDATED SUCCESSFULLY",completion: {
            self.navigate(storyboardName: Constants.HomeScreen, viewControllerID: EnumConstants.HomeScreenViewController.rawValue)
        })
        
    }
  




    func presentImagePickerActionSheet() {
        let actionSheet = UIAlertController(title: "Choose Profile Picture", message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { _ in
            self.openPhotoLibrary()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(actionSheet, animated: true, completion: nil)
    }

    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
        } else {
            print("Camera not available")
        }
    }

    func openPhotoLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
        } else {
            print("Photo Library not available")
        }
    }

    // UIImagePickerControllerDelegate Method
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            accountImg.image = editedImage
            saveImageToUserDefaults(image: editedImage, forKey: "profileImage")
        } else if let originalImage = info[.originalImage] as? UIImage {
            accountImg.image = originalImage
            saveImageToUserDefaults(image: originalImage, forKey: "profileImage")
        }
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func saveImageToUserDefaults(image: UIImage, forKey key: String) {
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            UserDefaults.standard.set(imageData, forKey: key)
        } else {
            print("Error: Unable to convert image to data")
        }
    }

}

