//
//  BaseRequestModel.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 20/04/2022.
//

import Foundation

protocol BaseRequestModel: Encodable {
    
}

extension BaseRequestModel {
    func getRequestParameters() -> [String: Any]? {
        let jsonEncoder = JSONEncoder()
        if let jsonData = try? jsonEncoder.encode(self) {
            do {
                return  try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
                return nil
            }
        }
        return nil
    }
}
