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
    
    func showAlert(title: String, message: String, actionTitle: String = "OK", style: UIAlertAction.Style = .default, completion : (()->Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: actionTitle, style: style) { _ in
            completion?()
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }

}
