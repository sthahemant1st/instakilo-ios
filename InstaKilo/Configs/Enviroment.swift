//
//  Enviroment.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 19/04/2022.
//

import Foundation

// TODO: project setup
public enum Environment {
    enum BuildState {
        case debug
        case staging
        case release
    }
    
    private static let production: BuildState = {
        #if DEBUG
        print("DEBUG")
        return .debug
        #elseif STAGING
        print("STAGING")
        return .staging
        #else
        print("RELEASE")
        return .release
        #endif
    }()
    
    static func buildState() -> BuildState {
        return self.production
    }
    
    enum Keys {
        enum Plist {
            static let rootUrl = "ROOT_URL"
            static let apiKey = "API_KEY"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    static let rootURL: URL = {
        guard let rootURLstring = Environment.infoDictionary[Keys.Plist.rootUrl] as? String else {
            fatalError("Root URL not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
            fatalError("Root URL is invalid")
        }
        return url
    }()
    
}
