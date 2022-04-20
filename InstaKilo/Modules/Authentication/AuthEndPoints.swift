//
//  AuthEndPoints.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 20/04/2022.
//

import Foundation
import Alamofire

struct LoginEndPoint: EndPointProtocol {
    var url: URL? = AppUrls.getAppUrl(fromPath: "auth/login")
    var method: HTTPMethod = .post
}
