//
//  StringExtension.swift
//  NeoSTORE
//
//  Created by Apple on 10/30/24.

import Foundation

extension String {
    func containsOnlyLetters() -> Bool {
        return self.allSatisfy({ $0.isLetter }) && self.count > 3
    }
    
    func containsOnlyNumbers() -> Bool {
        let numberCharacterSet = CharacterSet.decimalDigits
        return self.rangeOfCharacter(from: numberCharacterSet.inverted) == nil && self.count == 10
    }
    
    func isValidEmail() -> Bool {
        let emailPattern = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", emailPattern).evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        let pattern = "^(?=.*[A-Za-z])(?=.*[@$!%*?&#]).{6,}$"
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: self)
    }
}


