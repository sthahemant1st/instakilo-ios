//
//  BannerNotificationReusableView.swift
//  IOSHelperModules
//
//  Created by Insight Workshop on 2/21/19.
//  Copyright © 2019 InsightWorkshop. All rights reserved.
//

import UIKit

protocol NoInternetReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension NoInternetReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

protocol NoInternetNibLoadableView: AnyObject {
    static var nibName: String { get }
}

extension NoInternetNibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
