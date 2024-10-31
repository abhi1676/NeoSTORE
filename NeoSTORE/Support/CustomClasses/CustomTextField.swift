//
//  CustomTextField.swift
//  NeoSTORE
//
//  Created by Apple on 10/28/24.
//

import Foundation
import UIKit

class CustomTextField : UITextField,UITextFieldDelegate{
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupTextField()
        self.delegate = self
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupTextField()
            self.delegate = self
        }
        
        private func setupTextField() {
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.white.cgColor
            self.layer.cornerRadius = 0
            self.layer.masksToBounds = true
            self.textColor = .white
        }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
