//
//  AppTarget.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 20/04/2022.
//

import Foundation

enum Targets {
    case debug
    case staging
    case production
    case test
    
    var scheme: String {
        switch self {
        case .staging, .debug, .production: return "https"
        case .test: return "http"
        }
    }
        
    var host: String {
        switch self {
        case .staging, .debug: return "api-stage.dhukka.app"
        case .production: return "api.dhukka.app"
        case .test: return "ngrok"
        }
    }
}

// only change debug target, never and ever change production target as this may result in error when
// uploading app, use debug target for setting testApiKeys, pointing to debug server and running app
// during development
struct AppTarget {
    #if DEBUG
    static var currentTarget = Targets.staging
    #else
    //WARNING: never change production target other than to production and never use production target
    // in if condition to switch app behavior
    static var currentTarget = Targets.production
    #endif
}
