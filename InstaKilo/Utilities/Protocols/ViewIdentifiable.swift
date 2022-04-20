//
//  ViewIdentifiable.swift
//  Hopper
//
//  Created by Nutan Niraula on 2/7/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit

protocol ViewIdentifiable: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension ViewIdentifiable where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
