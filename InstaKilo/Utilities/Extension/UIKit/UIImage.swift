//
//  UIImage.swift
//  Yatru
//
//  Created by Sagun Raj Lage on 9/12/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit
import Accelerate

extension UIImage {
    
    func imageWithInsets(insetDimen: CGFloat) -> UIImage {
        return imageWithInset(insets: UIEdgeInsets(top: insetDimen,
                                                   left: insetDimen,
                                                   bottom: insetDimen,
                                                   right: insetDimen))
    }
    
    private func imageWithInset(insets: UIEdgeInsets) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(
            CGSize(width: self.size.width + insets.left + insets.right,
                   height: self.size.height + insets.top + insets.bottom), false, self.scale)
        let origin = CGPoint(x: insets.left, y: insets.top)
        self.draw(at: origin)
        let imageWithInsets = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(self.renderingMode)
        UIGraphicsEndImageContext()
        return imageWithInsets!
    }
    
}

// SDWebImage
extension UIImageView {
    func setImageFromUrl(urlString: String) {
        self.sd_setImage(
            with: URL(string: urlString),
            placeholderImage: UIImage(named: "AppIcon"),
            options: .lowPriority,
            context: nil
        )
    }
}
