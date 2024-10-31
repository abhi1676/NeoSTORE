//
//  TextFieldType.swift
//  NeoSTORE
//
//  Created by Apple on 10/30/24.
//

import Foundation

enum TextfieldType {
    case name(String)
    case email(String)
    case phoneNumber(String)
    case password(String)
    
    
    var isValid : Bool {
        switch self {
        case .name(let name):
            //validate using regex
        return name.containsOnlyLetters()
            
        case .email(let email):
            return email.isValidEmail()
            
        case .phoneNumber(let number):
            return number.containsOnlyNumbers()
            
        case .password(let password):
           
            return password.isValidPassword()
            
            
        default:
            return false
        }
        
    
    }
}





