//
//  AddressViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/14/24.
//

import UIKit

class AddressViewController: UIViewController {
    
    @IBOutlet var addressTextfield: UITextField!
    
    @IBOutlet var addressTextView: UITextView!
    
    
    @IBOutlet var landmarkTextfield: UITextField!
    
    @IBOutlet var cityTextfield: UITextField!
    
    @IBOutlet var stateTextfield: UITextField!
    
    @IBOutlet var zipcodeTextfield: UITextField!
    
    @IBOutlet var countryTextfield: UITextField!
    
    var addressArray = [String]()
    var temp:String = ""
    override func viewDidLoad() {
        hideKeyboardWhenTappedAround()
        super.viewDidLoad()
        zipcodeTextfield.keyboardType = .numberPad
        self.navigationController?.navigationBar.topItem?.title = ""
        print(UserDefaults.standard.stringArray(forKey: "Address") ?? "")
        self.title = "Add Address"
        addressTextView.delegate = self
        landmarkTextfield.delegate = self
        stateTextfield.delegate = self
        zipcodeTextfield.delegate = self
        countryTextfield.delegate = self
        cityTextfield.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Add Address"
        addressArray = UserDefaults.standard.stringArray(forKey: "Address") ?? []
    }

    @IBAction func saveAddressTapped(_ sender: Any) {
        
        guard let address = addressTextView.text, !address.isEmpty else {
            showAlert(title: "Error", message: "Address field cannot be empty.")
            return
        }
        
        guard let landmark = landmarkTextfield.text, !landmark.isEmpty else {
            showAlert(title: "Error", message: "Landmark field cannot be empty.")
            return
        }
        
        guard let city = cityTextfield.text, city.containsOnlyLetters() else {
            showAlert(title: "Error", message: "City should contain only letters and be at least 4 characters long.")
            return
        }
        
        guard let state = stateTextfield.text, state.containsOnlyLetters() else {
            showAlert(title: "Error", message: "State should contain only letters and be at least 4 characters long.")
            return
        }
        
        guard let zipcode = zipcodeTextfield.text, zipcode.containsNumbers() else {
            showAlert(title: "Error", message: "Zipcode should contains numbers only")
            return
        }
        
        
        let str = "\(address) \(landmark) \(city) \(state) \(zipcode)"
        addressArray.append(str)
        UserDefaults.standard.set(addressArray, forKey: "Address")
        print(addressArray.description)
        
        showAlert(title: "Success", message: "Added Address Successfully") {
            self.navigationController?.popViewController(animated: true)
        }
    }

    
    
    

}
extension AddressViewController:UITextViewDelegate,UITextFieldDelegate{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}
