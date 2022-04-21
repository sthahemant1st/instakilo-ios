//
//  BaseViewModel.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 21/04/2022.
//

import Foundation

class BaseViewModel {
    var alertMessage: ((String) -> Void)!
    var showActivityIndicator: (() -> Void) = {}
    var hideActivityIndicator: (() -> Void) = {}
    var invalidUser: (() -> Void) = {}
    var handleFailure: ((Error) -> Void)!
}
