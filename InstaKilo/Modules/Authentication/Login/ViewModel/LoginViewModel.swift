//
//  LoginViewModel.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 19/04/2022.
//

import Foundation
import RxSwift
import RxRelay

class LoginViewModel: BaseViewModel {
    // MARK: rx variables
    var username = BehaviorRelay<String>(value: "")
    var password = BehaviorRelay<String>(value: "")
    let loginButtonTapped = PublishSubject<Void>()
    var validateError = PublishSubject<String>()
    var loginSuccess = PublishSubject<Void>()
    private let disposeBag = DisposeBag()
    
    // MARK: other variables
    private var loginApiClient: APIClient!
    
    init(
        loginEndPoint: EndPointProtocol
    ) {
        loginApiClient = NetworkCaller(endPoint: loginEndPoint)
        super.init()
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
            login()
        }
    }
    
    private func login() {
        showActivityIndicator()
        let request = LoginRequest(username: username.value, password: password.value)
        loginApiClient.rxRequest(withObject: request, responseType: LoginResponse.self)
            .subscribe { [weak self] data in
                guard let self = self else { return }
                print("Sucess data ====> \(data)")
                TokenManager.global.accessToken = data.token
                self.loginSuccess.onNext(())
            } onFailure: { error in
                self.handleFailure(error)
            } onDisposed: {
                self.hideActivityIndicator()
            }
            .disposed(by: disposeBag)
    }
    
    // MARK: public functions
}

