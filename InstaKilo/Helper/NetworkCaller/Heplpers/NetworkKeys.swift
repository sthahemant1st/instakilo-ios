//
//  NetworkKeys.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 20/04/2022.
//

import Foundation

struct NetworkKeys {
    static let DeviceType = "ios"
    
    struct UserDefaults {
        static let accessToken = "access_token"
        static let refreshToken = "refresh_token"
        static let deviceToken = "device_token"
    }
    
    struct Headers {
        static let Authorization = "Authorization"
        static let ContentType = "Content-Type"
        static let DeviceId = "Device-Id"
        static let Platform = "Platform"
        static let Locale = "Locale"
        static let AppPlatform = "App-Platform"
        static let DhukkaPlatform = "Dhukka-platform"
    }
    
    struct LanguageCode {
        static let English = "en"
    }
}
