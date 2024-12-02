//
//  AddressViewController.swift
//  NeoSTORE
//
//  Created by Apple on 11/14/24.
//

import UIKit

class AddressViewController: UIViewController {
    
    @IBOutlet var addressTextfield: UITextField!
    
    @IBOutlet var landmarkTextfield: UITextField!
    
    @IBOutlet var cityTextfield: UITextField!
    
    @IBOutlet var stateTextfield: UITextField!
    
    @IBOutlet var zipcodeTextfield: UITextField!
    
    @IBOutlet var countryTextfield: UITextField!
    
    var addressArray = [String]()
    var temp:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        zipcodeTextfield.keyboardType = .numberPad
        self.navigationController?.navigationBar.topItem?.title = ""
        print(UserDefaults.standard.stringArray(forKey: "Address") ?? "")
        self.title = "Add Address"
    }
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Add Address"
        addressArray = UserDefaults.standard.stringArray(forKey: "Address") ?? []
    }

    @IBAction func saveAddressTapped(_ sender: Any) {
        guard let address = addressTextfield.text, !address.isEmpty else {
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
