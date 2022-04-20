//
//  TokenManager.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 20/04/2022.
//

import Foundation

class TokenManager: NSObject {
    
    static let global = TokenManager()
    var accessToken: String? {
        get {
            return UserDefaults.standard.string(forKey: NetworkKeys.UserDefaults.accessToken)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: NetworkKeys.UserDefaults.accessToken)
            UserDefaults.standard.synchronize()
        }
    }
    
}
