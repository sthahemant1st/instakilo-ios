//
//  LoginViewController.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 19/04/2022.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    // MARK: variables
//    weak var coordinator: AuthCoordinator
    let disposeBag = DisposeBag()
    var viewModel: LoginViewModel!

    // MARK: outlets
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    private func setupViewModel() {
        userNameField.rx
            .text
            .orEmpty
            .bind(to: viewModel.username)
            .disposed(by: disposeBag)
        passwordField.rx
            .text
            .orEmpty
            .bind(to: viewModel.password)
            .disposed(by: disposeBag)
        loginButton.rx
            .tap
            .bind(to: viewModel.loginButtonTapped)
            .disposed(by: disposeBag)
        
        viewModel.validateError.subscribe(onNext: { errorString in
            self.showAlertWithOk(withMessage: errorString )
        }).disposed(by: disposeBag)
        viewModel.loginSuccess.subscribe(onNext: {
            self.showAlertWithOk(withMessage: "Login Successful")
        }).disposed(by: disposeBag)
    }

}
