//
//  UITextField.swift
//  Yatru
//
//  Created by Insight Workshop on 11/1/19.
//  Copyright © 2019 Insight Workshop. All rights reserved.
//

import UIKit

extension UITextField {
    
   @objc  func getPlaceholder(with text: String, and color: UIColor, font: UIFont) -> NSAttributedString {
        let placeholderText = text
        let arrributes = [
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.font: font
        ]
        return NSAttributedString(string: placeholderText,
                                  attributes: arrributes)
    }
    
}
