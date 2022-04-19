//
//  NoInternetConnectionViewHandler.swift
//  Yatru
//
//  Created by Insight Workshop on 12/5/19.
//  Copyright © 2019 Insight Workshop. All rights reserved.
//

import UIKit

class NoInternetConnectionViewHandler: NSObject {
    
    static let shared: NoInternetConnectionViewHandler = { return NoInternetConnectionViewHandler() }()
    
    var window: UIWindow?
    
    private var noInternetConnectionView: UIView?
    private var isNoInternetViewShown = false
    
    override init() {
        super.init()
        DispatchQueue.main.async {
            self.window = NoInternetHelper.getAppWindow()
        }
    }
    
    func showNoInternetView() {
        DispatchQueue.main.async {
            self.noInternetConnectionView = UIView(frame: CGRect(x: 0,
                                                            y: NoInternetHelper.getNoNotificationViewHeight(),
                                                            width: NoInternetHelper.getScreenWidth(),
                                                            height: NoInternetHelper.getNoNotificationViewHeight()))
            self.noInternetConnectionView?.backgroundColor = .clear
            self.noInternetConnectionView?.addSubview(self.getNoInternetConnectionView())
            self.showNoInternetConnectionView()
        }
        
    }
    
    private func showNoInternetConnectionView() {
        guard let noInternetConnectionView = noInternetConnectionView else { return }
        if isNoInternetViewShown { return }
        DispatchQueue.main.async {
            NoInternetHelper.getAppWindow()?.addSubview(noInternetConnectionView)
        }
        noInternetConnectionView.layoutIfNeeded()
        showNoInternetConnectionView(noInternetConnectionView)
    }
    
    private func getNoInternetConnectionView() -> NoInternetConnectionView {
        let frame = CGRect(x: 0,
                           y: 0,
                           width: NoInternetHelper.getScreenWidth(),
                           height: NoInternetHelper.getNoNotificationViewHeight())
        let noInternetConnectionView = NoInternetConnectionView(frame: frame)
        noInternetConnectionView.layoutIfNeeded()
        return noInternetConnectionView
    }
    
    private func showNoInternetConnectionView(_ view: UIView) {
        isNoInternetViewShown = true
        let originY =  -(NoInternetHelper.topSafeAreaInset)
        //swiftlint:disable multiple_closures_with_trailing_closure
        UIView.animate(withDuration: 0.5, delay: 0, options: [.allowUserInteraction], animations: {
            view.frame.origin.y =  originY
        }) { _ in }
    }
    
    func hideNoInternetConnectionView() {
        guard let noInternetConnectionView = noInternetConnectionView else { return }
        UIView.animate(withDuration: 0.5, delay: 0,
                       options: [.allowUserInteraction],
                       animations: {
                        noInternetConnectionView.frame.origin.y = NoInternetHelper.getNoNotificationViewHeight()
        }, completion: { _ in
            self.remove(view: noInternetConnectionView)
        })
    }
    
    private func remove(view: UIView) {
        view.removeFromSuperview()
        isNoInternetViewShown = false
    }
    
}
