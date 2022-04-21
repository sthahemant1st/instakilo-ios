//
//  UIViewController.swift
//  Yatru
//
//  Created by Sagun Raj Lage on 8/6/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    
    func present(_ viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
    
    func showAlert(alertTitle: String = AppConstants.appName,
                   withMessage message: String,
                   okTitle: String = "Yes",
                   okHandler: @escaping () -> Void = {},
                   cancelTitle: String = "Cancel",
                   cancelHandler: @escaping () -> Void = {}) {
        let alertController = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okTitle, style: .default) { (_) in
            okHandler()
        }
        let cancelAction = UIAlertAction(title: cancelTitle, style: .default) { (_) in
            cancelHandler()
        }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        alertController.view.tintColor = #colorLiteral(red: 0.262745098, green: 0.262745098, blue: 0.262745098, alpha: 1)
        present(alertController, animated: true, completion: nil)
    }
    
    func showAlertWithOk(alertTitle: String = AppConstants.appName,
                         withMessage message: String,
                         okTitle: String = "OK",
                         okAction: @escaping () -> Void = {}) {
        let alertController = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okTitle, style: .default) { (_) in
            okAction()
        }
        alertController.view.tintColor = #colorLiteral(red: 0.262745098, green: 0.262745098, blue: 0.262745098, alpha: 1)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func showAlertSheetWithTwoAction(
        alertTitle: String = AppConstants.appName,
        alertMessage: String? = nil,
        firstActionTitle: String = "OK",
        onFirstAction: @escaping () -> Void = {},
        secondActionTitle: String = "OK",
        secondActionStyle: UIAlertAction.Style = .destructive,
        onsecondAciton: @escaping () -> Void = {}
    ) {
        let ac = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .actionSheet)
        
        let firstAction = UIAlertAction(title: firstActionTitle, style: .default, handler: { (_) in
            onFirstAction()
        })
        let secondAction = UIAlertAction(title: secondActionTitle, style: secondActionStyle, handler: { (_) in
            onsecondAciton()
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        ac.addAction(firstAction)
        ac.addAction(secondAction)
        ac.addAction(cancelAction)
        present(ac, animated: true, completion: nil)
    }
    
    func showAlertSheetWithThreeAction(
        alertTitle: String = AppConstants.appName,
        firstActionTitle: String = "OK",
        onFirstAction: @escaping () -> Void = {},
        secondActionTitle: String = "OK",
        onsecondAction: @escaping () -> Void = {},
        thirdActionTitle: String = "OK",
        thirdActionStyle: UIAlertAction.Style = .destructive,
        onThirdAction: @escaping () -> Void = {}
    ) {
        let ac = UIAlertController(title: alertTitle, message: nil, preferredStyle: .actionSheet)
        
        let firstAction = UIAlertAction(title: firstActionTitle, style: .default, handler: { (_) in
            onFirstAction()
        })
        let secondAction = UIAlertAction(title: secondActionTitle, style: .default, handler: { (_) in
            onsecondAction()
        })
        let thirdAction = UIAlertAction(title: thirdActionTitle, style: thirdActionStyle, handler: { (_) in
            onThirdAction()
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        ac.addAction(firstAction)
        ac.addAction(secondAction)
        ac.addAction(thirdAction)
        ac.addAction(cancelAction)
        present(ac, animated: true, completion: nil)
    }
    
    func showAlertSheetWithSingleAction(
        alertTitle: String = AppConstants.appName,
        firstActionTitle: String = "Add",
        onFirstAction: @escaping () -> Void = {}
    ) {
        let ac = UIAlertController(title: alertTitle, message: nil, preferredStyle: .actionSheet)
        
        let firstAction = UIAlertAction(title: firstActionTitle, style: .default, handler: { (_) in
            onFirstAction()
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        ac.addAction(firstAction)
        ac.addAction(cancelAction)
        present(ac, animated: true, completion: nil)
    }

    func openUrlString(_ string: String) {
        if let url = URL(string: string),
            UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    func callNumber(_ number: String) {
        guard let url = URL(string: "tel://\(number)")  else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        
        return instantiateFromNib()
    }
}

extension UIViewController {
    private func setProgressHud() -> MBProgressHUD {
        let progressHud: MBProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        // progressHud.tintColor = UIColor.darkGray
        progressHud.removeFromSuperViewOnHide = true
        progressHud.mode = .indeterminate
        progressHud.animationType = .fade
        progressHud.contentColor = .lightGray
        // progressHud.label.textColor = .darkGray
        objc_setAssociatedObject(self, &Associate.hud, progressHud, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return progressHud
    }
    var progressHud: MBProgressHUD {
        if let progressHud = objc_getAssociatedObject(self, &Associate.hud) as? MBProgressHUD {
            progressHud.isUserInteractionEnabled = true
            return progressHud
        }
        return setProgressHud()
    }
    var progressHudIsShowing: Bool {
        return self.progressHud.isHidden
    }
    func showProgressHud() {
        DispatchQueue.main.async {
            self.progressHud.show(animated: false)
        }
    }
    func showProgressHud(label: String = "") {
        self.progressHud.label.text = label
        self.progressHud.show(animated: false)
    }
    func hideProgressHud() {
        DispatchQueue.main.async {
            self.progressHud.label.text = ""
            self.progressHud.completionBlock = {
                objc_setAssociatedObject(self, &Associate.hud, nil, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            self.progressHud.hide(animated: false)
        }
    }
}

struct Associate {
    static var hud: UInt8 = 0
}
