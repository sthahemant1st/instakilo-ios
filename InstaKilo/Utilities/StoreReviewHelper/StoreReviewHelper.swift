//
//  StoreReviewHelper.swift
//  Yatru
//
//  Created by Insight Workshop on 12/9/19.
//  Copyright © 2019 Insight Workshop. All rights reserved.
//
//swiftlint:disable all
import Foundation
import StoreKit

struct StoreReviewHelper {
    
    static func incrementAppOpenedCount() {
        // called from appdelegate didfinishLaunchingWithOptions:
        guard var appOpenCount = UserDefaults.standard
            .value(forKey: AppConstants.UserDefaults.APP_OPENED_COUNT) as? Int else {
            UserDefaults.standard.set(1, forKey: AppConstants.UserDefaults.APP_OPENED_COUNT)
            return
        }
        appOpenCount += 1
        UserDefaults.standard.set(appOpenCount, forKey: AppConstants.UserDefaults.APP_OPENED_COUNT)
        
    }
    
    static func checkAndAskForReview() {
        // call this whenever appropriate
        // this will not be shown everytime. Apple has some internal logic on how to show this.
        guard let appOpenCount = UserDefaults.standard
            .value(forKey: AppConstants.UserDefaults.APP_OPENED_COUNT) as? Int else {
            UserDefaults.standard.set(1, forKey: AppConstants.UserDefaults.APP_OPENED_COUNT)
            return
        }
        
        switch appOpenCount {
        case 30, 50:
            StoreReviewHelper().requestReview()
        case _ where appOpenCount%100 == 0 :
            StoreReviewHelper().requestReview()
        default:
            print("App run count is : \(appOpenCount)")
            break
        }
    }
    
    fileprivate func requestReview() {
       SKStoreReviewController.requestReview()
    }
    
}
//swiftlint:enable all
