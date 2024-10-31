//
//  UILabelExtension.swift
//  NeoSTORE
//
//  Created by Apple on 10/29/24.
//

import Foundation
import UIKit
extension UILabel{
    func setUnderLineToLabel(_ label: UILabel, _ attributedPart: String) {
        let text = label.text ?? ""
        let attributedText = NSMutableAttributedString(string: text)
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]

        if let range = text.range(of: attributedPart) {
            let nsRange = NSRange(range, in: text)
            attributedText.addAttributes(underlineAttribute, range: nsRange)
        }
        label.attributedText = attributedText
    }

}
