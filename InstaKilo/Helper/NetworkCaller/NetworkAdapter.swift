//
//  NetworkAdapter.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 20/04/2022.
//

import Foundation
import Alamofire

class NetworkAdapter: RequestAdapter {
    
    func adapt(_ urlRequest: URLRequest,
               for session: Session,
               completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        
        if  let uuid = UIDevice.current.identifierForVendor?.uuidString {
            urlRequest.setValue(uuid, forHTTPHeaderField: NetworkKeys.Headers.DeviceId)
        }
        
        urlRequest.setValue("ios", forHTTPHeaderField: NetworkKeys.Headers.DhukkaPlatform)
        
        guard let authToken = TokenManager.global.accessToken else {
            completion(.success(urlRequest))
            return
        }
        
        //handle headers when user is not logged in
//        urlRequest.setValue(NetworkKeys.DeviceType, forHTTPHeaderField: NetworkKeys.Headers.AppPlatform)
        urlRequest.setValue(String(format: "Token %@", authToken),
                                  forHTTPHeaderField: NetworkKeys.Headers.Authorization)
        
        completion(.success(urlRequest))
    }
    
}
