//
//  NetworkRetrier.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 20/04/2022.
//

import Foundation
import Alamofire

///https://github.com/Alamofire/Alamofire/blob/master/Documentation/AdvancedUsage.md#requestadapter
///if need to apply requestRetrier
class NetworkRetrier: RequestRetrier {
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        
        completion(.doNotRetry)
    }
}
