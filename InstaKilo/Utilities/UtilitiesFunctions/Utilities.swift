//
//  Utility.swift
//  Yatru
//
//  Created by Sagun Raj Lage on 9/19/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit

struct Utilities {
    
    static var appDelegate: AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }
    
    static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    static var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    static func logAllAvailableFonts() {
        for family in UIFont.familyNames {
            print("\(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("   \(name)")
            }
        }
    }
    
    static func isPhone5sOrless() -> Bool {
        return (UIScreen.main.nativeBounds.height == 960.0) || (UIScreen.main.nativeBounds.height == 1136.0)
    }
    
    // should take bottomSafeAreaHeight form SceneDelegate.
//    static var bottomSafeAreaHeight: CGFloat {
//        guard let window = Utilities.appDelegate?.window else { return 0.0 }
//        return window.safeAreaInsets.bottom
//    }
    
    static func stringify(json: Any, prettyPrinted: Bool = false) -> String {
        var options: JSONSerialization.WritingOptions = []
        if prettyPrinted {
            options = JSONSerialization.WritingOptions.prettyPrinted
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: options)
            if let string = String(data: data, encoding: String.Encoding.utf8) {
                return string
            }
        } catch {
            print(error)
        }
        
        return ""
    }
    
}
