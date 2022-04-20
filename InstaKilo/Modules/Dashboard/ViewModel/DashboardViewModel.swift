//
//  DashboardViewModel.swift
//  InstaKilo
//
//  Created by Hemant Shrestha on 20/04/2022.
//

import Foundation
import RxSwift

final class DashboardViewModel {
    let logoutButtonTapped = PublishSubject<Void>()
    let disposeBag = DisposeBag()
    
    init() {
        bind()
    }
    
    private func bind() {
        logoutButtonTapped.subscribe(onNext: {
            print("logout pressed")
        }).disposed(by: disposeBag)
    }
}
