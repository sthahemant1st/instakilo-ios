//
//  UIApplication.swift
//  Yatru
//
//  Created by Sagun Raj Lage on 8/19/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit

extension UIApplication {
    
    static var appVersion: String? {
        let dictionary = Bundle.main.infoDictionary!
        // swiftlint:disable force_cast
        let version = dictionary["CFBundleShortVersionString"] as! String
//        let build = dictionary["CFBundleVersion"] as! String
        // swiftlint:enable force_cast
        return "\(version)"
    }
    
}
