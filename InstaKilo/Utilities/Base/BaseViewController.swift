//
//  BaseViewController.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 21/04/2022.
//

import UIKit

class BaseViewController: UIViewController {
    var baseViewModel = BaseViewModel()
    var activityIndicatorView = ActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeErrorMessage()
        observeHideActivityIndicatorCommand()
        observeShowActivityIndicatorCommand()
        observeInvalidUserCommand()
        observeErrorCommand()
    }
    
    private func observeShowActivityIndicatorCommand() {
        baseViewModel.showActivityIndicator = { [weak self] in
            print("show")
            self?.showProgressHud()
        }
    }
    
    private func observeInvalidUserCommand() {
        baseViewModel.invalidUser = { [weak self] in
            self?.showInvalidUserAlert()
        }
    }
    
    private func observeHideActivityIndicatorCommand() {
        baseViewModel.hideActivityIndicator = { [weak self] in
            self?.hideProgressHud()
        }
    }
    
    private func observeErrorMessage() {
        baseViewModel.alertMessage = { [weak self] (message) in
            self?.showAlertWithOk(withMessage: message)
        }
    }
    
    private func observeErrorCommand() {
        baseViewModel.handleFailure = { [weak self] (error) in
            guard let self = self else { return }
            if let networkError = error as? NetworkError {
                switch networkError {
                case .sessionExpired:
                    self.showInvalidUserAlert()
                default:
                    self.showAlertWithOk(withMessage: error.localizedDescription)
                }
            } else {
                if (error as NSError).code != -1009 {
                    self.showAlertWithOk(withMessage: error.localizedDescription)
                }
            }
        }
    }
    
    func showInvalidUserAlert() {
        showAlertWithOk(withMessage: "Looks like your session has expired. Please login again") {
            UserSessionManager.logout()
            SceneDelegate.getDelegate().instantiateViewController()
        }
    }
}
