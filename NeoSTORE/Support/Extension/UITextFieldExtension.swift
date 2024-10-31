//
//  UITextFieldExtension.swift
//  NeoSTORE
//
//  Created by Apple on 10/28/24.
//

import Foundation
import UIKit
extension UITextField{
    func setIcon(_ image: UIImage) {
       let iconView = UIImageView(frame:
                      CGRect(x: 10, y: 7, width: 17, height: 20))
       iconView.image = image
       let iconContainerView: UIView = UIView(frame:
                      CGRect(x: 20, y: 0, width: 40, height: 30))
       iconContainerView.addSubview(iconView)
       leftView = iconContainerView
        leftViewMode = .always
    }
    
    func setPlaceholderText(_ text:String,_ color : UIColor){
        let PlaceholderText = NSAttributedString(string: text,
                                                    attributes: [NSAttributedString.Key.foregroundColor: color])
        self.attributedPlaceholder = PlaceholderText
    }
    
   
}
