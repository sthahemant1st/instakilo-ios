//
//  AppUrls.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 20/04/2022.
//

import Foundation

struct AppUrls {
    
    static let host = AppTarget.currentTarget.host
    static let scheme = AppTarget.currentTarget.scheme
    
    private static let urlBuilder = URLBuilder().set(scheme: scheme).set(host: host)

    static func getAppUrl(fromPath path: String) -> URL? {
        return AppUrls.urlBuilder.set(path: "api/v1/\(path)").build()
    }
    
    static func getOtherUrl(fromPath path: String) -> URL? {
        if AppTarget.currentTarget == .staging {
            return URL(string: "\(scheme)://\(host)/\(path)")
        }
        return URL(string: "\(scheme)://\(host)/\(path)")
    }

}
