//
//  LoginViewModel.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 19/04/2022.
//

import Foundation
import RxSwift
import RxRelay

class LoginViewModel {
    
    var username = BehaviorRelay<String>(value: "")
    var password = BehaviorRelay<String>(value: "")
    var loginButtonTapped = PublishSubject<Void>()
    var validateError = PublishSubject<String>()
    var loginSuccess = PublishSubject<Void>()
    
    private let disposeBag = DisposeBag()
    
    init() {
        bind()
    }
    
    // MARK: private functions
    private func bind() {
        loginButtonTapped.subscribe(onNext: {
            self.validateAndLogin()
        }).disposed(by: disposeBag)
    }
    
    private func validateAndLogin() {
        if username.value.isEmpty {
            validateError.onNext("Invalid Username")
        } else if password.value.isEmpty {
            validateError.onNext("Invalid Password")
        } else {
            loginSuccess.onNext(())
        }
    }
    
    // MARK: public functions
}
