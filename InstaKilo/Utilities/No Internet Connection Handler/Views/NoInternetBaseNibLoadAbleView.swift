//
//  BannerNotificationBaseNibLoadAbleView.swift
//  IOSHelperModules
//
//  Created by Insight Workshop on 2/21/19.
//  Copyright © 2019 InsightWorkshop. All rights reserved.
//

import UIKit

class NoInternetBaseNibLoadAbleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {}
    
    func update(_ contentView: UIView) {
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
}

extension NoInternetBaseNibLoadAbleView: NoInternetReusableView,
            NoInternetNibLoadableView {}

extension UIView {
    
    func loadNib<T: UIView>(_: T.Type) where T: NoInternetReusableView {
        Bundle.main.loadNibNamed(T.defaultReuseIdentifier, owner: self, options: nil)
    }
    
}
