//
//  AuthenticationCoordinator.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 21/04/2022.
//

import UIKit

final class AuthCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController nc: UINavigationController) {
        self.navigationController = nc
        super.init()
        
        navigationController.delegate = self
    }
    
    func start() {
        let loginVC = LoginViewController.loadFromNib()
        let loginViewModel = LoginViewModel(
            loginEndPoint: LoginEndPoint()
        )
        loginVC.viewModel = loginViewModel
        loginVC.coordinator = self
        navigationController.setViewControllers([loginVC], animated: true)
        
    }
    
    func onLoginSuccess() {
        SceneDelegate.getDelegate().instantiateViewController()
//        let dashboardCoordinator = DashboardCoordinator(navigationController: navigationController)
//        dashboardCoordinator.start()
    }
    
    // MARK: handle child coordinator
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController
                .transitionCoordinator?.viewController(forKey: .from) else { return }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
    }
    
    private func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                print("child coordinator removed")
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
}
