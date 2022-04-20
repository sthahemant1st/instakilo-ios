//
//  LoginResponse.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 20/04/2022.
//

import Foundation

struct LoginResponse: Codable {
    let expiry: String?
    let token: String
    let user: User
}

// MARK: - User
struct User: Codable {
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let currentAddress: String
    let addressLat, addressLng: String?
    let birthdate: String?
    let gender: String?
    let profilePicture: String?
    let displayName: String
    let username: String

    enum CodingKeys: String, CodingKey {
        case username
        case phoneNumber = "phone_number"
        case displayName = "display_name"
        case firstName = "first_name"
        case lastName = "last_name"
        case currentAddress = "current_address"
        case gender, birthdate
        case profilePicture = "profile_picture"
        case addressLat = "address_lat"
        case addressLng = "address_lng"
    }
}
