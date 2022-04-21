//
//  NetworkCallerFactory.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 21/04/2022.
//

import Foundation

enum NetworkCallerTypes {
    case http
    case mockHttp(mockCaller: APIClient)
}

class NetworkCallerFactory {
    
    var callerType: NetworkCallerTypes
    
    init(callerType type: NetworkCallerTypes = .http) {
        callerType = type
    }
    
    func createNetworkCaller(endPoint ep: EndPointProtocol) -> APIClient {
        switch callerType {
        case .http:
            return NetworkCaller(endPoint: ep)
        case .mockHttp(let mockCaller):
            return mockCaller
        }
    }
}
