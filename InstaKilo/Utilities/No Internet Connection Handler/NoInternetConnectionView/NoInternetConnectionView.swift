//
//  NoInternetConnectionView.swift
//  Yatru
//
//  Created by Insight Workshop on 12/5/19.
//  Copyright © 2019 Insight Workshop. All rights reserved.
//
//swiftlint:disable all
import UIKit
import ReachabilitySwift

class NoInternetConnectionView: NoInternetBaseNibLoadAbleView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet var wrapperBackgroundView: UIView!
    @IBOutlet var refreshBtn: UIButton!
    
    override func commonInit() {
        loadNib(NoInternetConnectionView.self)
        update(contentView)
        contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        beautifyView()
    }
    
    private func beautifyView() {
        wrapperBackgroundView.backgroundColor = .clear
        wrapperBackgroundView.layer.shadowColor = UIColor.lightGray.cgColor
        wrapperBackgroundView.layer.shadowOffset = CGSize(width:0.0, height: -10.0)
        wrapperBackgroundView.layer.shadowOpacity = 0.9
        wrapperBackgroundView.layer.shadowRadius = 20.0
        wrapperView.layer.cornerRadius = 30.0
        wrapperView.layer.masksToBounds = true
        refreshBtn.layer.cornerRadius = refreshBtn.bounds.size.height / 2.0
        refreshBtn.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        beautifyView()
    }
    
    @IBAction func onRefreshBtnClick(_ sender: UIButton) {
        if let reachabilityStatus = Reachability()?.currentReachabilityStatus {
            if reachabilityStatus != .notReachable {
                NoInternetConnectionViewHandler.shared.hideNoInternetConnectionView()
            }
        }
    }
    
}
//swiftlint:enable all
