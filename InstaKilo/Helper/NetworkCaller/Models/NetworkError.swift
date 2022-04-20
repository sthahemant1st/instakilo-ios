//
//  NetworkError.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 19/04/2022.
//

import Foundation

enum NetworkError: Error {
    case notConnectedToInternet
    case timeOut
    case cancelled
    case badUrl
    case networkConnectionLost
    case networkResourceUnavailable
    case apiError(apiMessage: String, code: String)
    case cannotParseJsonError
    case noMobileDataAvailable //return 410 status code
    case sixtyAttemptsExceededInOneMinute
    case sessionExpired
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .notConnectedToInternet:
            return "No Internet connection."
        case .timeOut:
            return "Request Timeout"
        case .cancelled:
            break
        case .badUrl:
            break
        case .networkConnectionLost:
            break
        case .networkResourceUnavailable:
            break
        case .apiError(let apiMessage, _):
            return NSLocalizedString(apiMessage, comment: "came from api error")
        case .cannotParseJsonError:
            break
        case .noMobileDataAvailable:
            break
        case .sixtyAttemptsExceededInOneMinute:
            break
        case .sessionExpired:
            return "Seems like session has expired. Please login again"
        }
        return NSLocalizedString("Unknown error", comment: "came from localized custom error")
    }
}
