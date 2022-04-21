//
//  DashboardViewController.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 20/04/2022.
//

import UIKit
import RxSwift
import RxCocoa

class DashboardViewController: UIViewController {
    weak var coordinator: DashboardCoordinator!
    
    var viewModel: DashboardViewModel!
    let disposeBag = DisposeBag()

    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    private func configureViews() {
        logoutButton.rx
            .tap
            .subscribe(onNext: {
                print("logout")
                self.coordinator.onLogout()
            }).disposed(by: disposeBag)

    }

}
