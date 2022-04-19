//
//  BannerNotificationViewExtension.swift
//  IOSHelperModules
//
//  Created by Insight Workshop on 2/21/19.
//  Copyright © 2019 InsightWorkshop. All rights reserved.
//
//swiftlint:disable all
import UIKit

extension UIView {
    
    func noInternetLoadNib<T: UIView>(_: T.Type) where T: NoInternetReusableView {
        Bundle.main.loadNibNamed(T.defaultReuseIdentifier, owner: self, options: nil)
    }
    
    func noInternetLoadNib<T: UIView>(_: T.Type, _ name: String) where T: NoInternetReusableView {
        Bundle.main.loadNibNamed(name, owner: self, options: nil)
    }
    
    func setAllSideShadow<T: UIView>(_: T.Type,
                                     shadowShowSize: CGFloat = 1.0,
                          with color: UIColor = UIColor.lightGray.withAlphaComponent(0.5)) where T: NoInternetReusableView {
        
        let shadowSize: CGFloat = shadowShowSize
        let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
                                                   y: -shadowSize / 2,
                                                   width: frame.size.width + shadowSize,
                                                   height: frame.size.height + shadowSize))
        layer.masksToBounds = false
        layer.cornerRadius = 10.0
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowOpacity = 0.3
        layer.shadowPath = shadowPath.cgPath
    }
    
    func addCornerRadius<T: UIView>(_: T.Type,
                                    with cornerRadius: CGFloat = 5.0) where T: NoInternetReusableView {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
   
}
//swiftlint:enable all
