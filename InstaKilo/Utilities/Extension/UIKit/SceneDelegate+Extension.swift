//
//  SceenDelegate.swift
//  Dhukka
//
//  Created by Hemant Shrestha on 31/03/2022.
//

import Foundation
import UIKit

extension SceneDelegate {
    static func getDelegate() -> SceneDelegate {
        return UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
    }
    
//    func getWindow() -> UIWindow {
//        return UIApplication.shared.connectedScenes.first!.window
//    }
}
