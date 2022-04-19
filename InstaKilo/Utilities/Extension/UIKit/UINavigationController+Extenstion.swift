//
//  UINavigationController+Extenstion.swift
//  Dhukka
//
//  Created by Hemant Shrestha on 24/03/2022.
//

import Foundation
import UIKit

extension UINavigationController {
    func configureTabBar(title: String, systemImageName: String) {
      let tabBarItemImage = UIImage(systemName: systemImageName)
      tabBarItem = UITabBarItem(title: title,
                                image: tabBarItemImage,
                                selectedImage: tabBarItemImage)
    }
}
