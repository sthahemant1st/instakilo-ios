//
//  UserSessionManager.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 21/04/2022.
//

import Foundation

class UserSessionManager {
    static var isUserLoggedIn: Bool {
        return TokenManager.global.accessToken.hasValue
    }
    
    static func logout() {
        TokenManager.global.accessToken = nil
    }
}
