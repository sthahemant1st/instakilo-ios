//
//  UITableView.swift
//  Yatru
//
//  Created by Sagun Raj Lage on 8/14/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
extension UITableView {
    // Hemant: this above two function is easy to use
    func register<T: UITableViewCell>(_: T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.defaultReuseIdentifier, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identified: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
    
    func register<T: UITableViewCell>(_: T.Type) where T: ViewIdentifiable {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func register<T: UITableViewCell>(_: T.Type) where T: ViewIdentifiable, T: NibLoadable {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: ViewIdentifiable {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identified: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
    
}
