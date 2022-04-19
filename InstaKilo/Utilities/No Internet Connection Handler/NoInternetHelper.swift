//
//  ReachabilityHelper.swift
//  Yatru
//
//  Created by Insight Workshop on 12/5/19.
//  Copyright © 2019 Insight Workshop. All rights reserved.
//

import UIKit

class NoInternetHelper {
    
    static func getAppWindow() -> UIWindow? {
        return NoInternetHelper.getAppDelegate()?.window
    }
    
    static func getAppDelegate() -> AppDelegate? {
        return (UIApplication.shared.delegate as? AppDelegate)
    }
    
    static func getScreenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    static func getScreenHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
    static var topSafeAreaInset: CGFloat {
        if #available(iOS 11.0, *) {
            
            return UIApplication
                .shared
                .windows
                .filter {$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0
//            return UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
        } else {
            // Fallback on earlier versions
            return UIApplication.shared.keyWindow?.rootViewController?.topLayoutGuide.length ?? 0
        }
    }
    
    static func getNoNotificationViewHeight() -> CGFloat {
        return NoInternetHelper.getScreenHeight()
    }
    
}
