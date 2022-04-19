//
//  Int.swift
//  Yatru
//
//  Created by Insight Workshop on 10/1/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit

extension Int {
    
    var stringValue: String {
        return "\(self)"
    }
    var absolute: Int {
        return abs(self)
    }
    
    var toFloat: Float {
        return Float(self)
    }
    
    var toDouble: Double {
        return Double(self)
    }
    
    var toPaisa: Int {
        return self * 100
    }
    
}

extension Optional where Wrapped == Int {
    var unWrapped: Int {
        return self ?? -1
    }
}
