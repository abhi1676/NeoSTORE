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
        
        if var address = addressTextfield.text {
            
            let landmark = landmarkTextfield.text ?? ""
            let city = cityTextfield.text ?? ""
            let state = stateTextfield.text ?? ""
            let zipcode = zipcodeTextfield.text ?? ""
            
         let str = "\(address) \(landmark) \(city) \(state) \(zipcode)"
            temp+=str
            
         
            addressArray.append(temp)
            UserDefaults.standard.set(addressArray, forKey: "Address")
            print(addressArray.description)
        }
        showAlert(title: "DONE", message: "Added Address Successfully"){
            self.navigationController?.popViewController(animated: true)
        }
    }
    

}
