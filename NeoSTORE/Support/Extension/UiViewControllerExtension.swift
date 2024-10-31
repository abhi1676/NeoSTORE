//
//  UiViewControllerExtension.swift
//  NeoSTORE
//
//  Created by Apple on 10/30/24.
//


import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true) 
    }
}
