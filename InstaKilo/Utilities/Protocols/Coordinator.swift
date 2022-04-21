//
//  Coordinator.swift
//  Yatru
//
//  Created by Sagun Raj Lage on 9/2/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    init(navigationController nc: UINavigationController)
    func start()
}
 
