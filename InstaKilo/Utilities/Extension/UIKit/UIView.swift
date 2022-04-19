//
//  UIView.swift
//  Yatru
//
//  Created by Sagun Raj Lage on 8/8/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit
import CryptoKit

extension UIView {
    
    func loadNib<T: UIView>(_: T.Type) where T: ViewIdentifiable {
        Bundle.main.loadNibNamed(T.defaultReuseIdentifier, owner: self, options: nil)
    }
    
    func addCornerRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func addCircleCornerRadius() {
        layer.cornerRadius = self.frame.height / 2
        layer.masksToBounds = true
    }
    
    func addborder(of width: CGFloat, with color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    func setShadow(with height: CGFloat = 5.0, and color: UIColor = UIColor.black) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0, height: height)
        layer.shadowOpacity = 0.5
    }
    
    func roundUpperCorners(cornerRadius: Double) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight],
                                cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    
    func roundBottomCorners(cornerRadius: Double) {
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    func setAllSideShadow(shadowShowSize: CGFloat = 1.0,
                          with color: UIColor = UIColor.lightGray.withAlphaComponent(0.5)) {
        
        let shadowSize: CGFloat = shadowShowSize
        let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
                                                   y: -shadowSize / 2,
                                                   width: frame.size.width + shadowSize,
                                                   height: frame.size.height + shadowSize))
        layer.masksToBounds = false
        layer.cornerRadius = 10.0
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowOpacity = 0.3
        layer.shadowPath = shadowPath.cgPath
    }
    
    func addShadow(color: UIColor, radius : CGFloat = 3) {
        layer.masksToBounds = false
        layer.shadowOpacity = 1
        layer.shadowColor = color.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = radius
        
        layer.shouldRasterize = true
        layer.rasterizationScale = true ? UIScreen.main.scale : 1
        
    }
    
    func addDashedBottomBorder(strokeColor: UIColor, lineWidth: CGFloat) {
        backgroundColor = .clear
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.name = "DashedBottomBorderLine"
        shapeLayer.bounds = bounds
        shapeLayer.position = CGPoint(x: frame.width / 2, y: frame.height / 2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        let dashLength = self.bounds.width / 5
        let undashLength = self.bounds.width / 16
        shapeLayer.lineDashPattern = [NSNumber(value: Float(dashLength)), NSNumber(value: Float(undashLength))]
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: bounds.minX, y: bounds.maxY))
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        shapeLayer.path = path
        
        layer.addSublayer(shapeLayer)
    }
    
}
