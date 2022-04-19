//
//  UIColor.swift
//  Yatru
//
//  Created by Sagun Raj Lage on 8/8/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
}
