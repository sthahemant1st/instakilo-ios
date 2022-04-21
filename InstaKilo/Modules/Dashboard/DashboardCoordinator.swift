//
//  DashboardCoordinator.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 21/04/2022.
//

import UIKit
import Alamofire

final class DashboardCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController nc: UINavigationController) {
        self.navigationController = nc
    }
    
    func start() {
        let dashboardVC = DashboardViewController.loadFromNib()
        let dashboardViewModel = DashboardViewModel()
        dashboardVC.viewModel = dashboardViewModel
        dashboardVC.coordinator = self
        navigationController.setViewControllers([dashboardVC], animated: true)
    }
    
    func onLogout() {
        print("onLogut")
        UserSessionManager.logout()
        SceneDelegate.getDelegate().instantiateViewController()
//        let authCoordinator = AuthCoordinator(navigationController: navigationController)
//        authCoordinator.start()
    }
    
}
