//
//  String.swift
//  Yatru
//
//  Created by Sagun Raj Lage on 8/6/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var toDouble: Double {
        return Double(self).unWrapped
    }
    
    var intValue: Int {
        return Int(self) ?? 0
    }
    
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
    
    var capitalizedFullName: String {
        let componenets = self.split(separator: " ")
        let capitalizedComponents = componenets.map { (subString) -> String in
            return String(subString).capitalizedFirstLetter
        }
        return capitalizedComponents.joined(separator: " ")
    }
    
    var capitalizedFirstLetter: String {
        return prefix(1).capitalized + dropFirst()
    }
    
    var isInValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return !(predicate.evaluate(with: self))
    }
    
    var isValidPassword: Bool {
        let passwordRegEx = "^(?=.*?[A-Za-z])(?=.*?[0123456789#?!@$%^&*-]).{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return predicate.evaluate(with: self)
    }
    
    var isValidFullName: Bool {
        let alphaRegEx = "[A-Za-z ]+"
        let predicate = NSPredicate(format: "SELF MATCHES %@", alphaRegEx)
        return predicate.evaluate(with: self)
    }
    
    var isInValidPhoneNumber: Bool {
        let alphaRegEx = "[0-9]{10}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", alphaRegEx)
        return !(predicate.evaluate(with: self))
    }
    
    func getColoredSubString(with subStringToColor: String,
                             and color: UIColor) -> NSAttributedString {
        let range = (self as NSString).range(of: subStringToColor)
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor,
                                      value: color,
                                      range: range)
        return attributedString
    }
    
    func getColoredSubString(with subStringToColor1: String,
                             andWith subStringToColor2: String,
                             and color: UIColor) -> NSAttributedString {
        let range1 = (self as NSString).range(of: subStringToColor1)
        let range2 = (self as NSString).range(of: subStringToColor2)
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor,
                                      value: color,
                                      range: range1)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor,
                                      value: color,
                                      range: range2)
        return attributedString
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
//    func addTapGestureSubString(
//        withColor color: UIColor,
//        subString: String,
//        onTap: () -> Void
//    ) -> NSAttributedString {
//        let range = (self as NSString).range(of: subString)
//        let attributedString = NSMutableAttributedString(string: self)
//        attributedString.addAttribute(NSAttributedString.Key.foregroundColor,
//                                      value: color,
//                                      range: range)
//        return attributedString
//    }
    
}

extension Optional where Wrapped == String {
    
    var unWrapped: String {
        return self ?? ""
    }
    
}

//extension UITapGestureRecognizer {
//
//   func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
//       guard let attributedText = label.attributedText else { return false }
//
//       let mutableStr = NSMutableAttributedString.init(attributedString: attributedText)
//       mutableStr.addAttributes([NSAttributedString.Key.font : label.font!], range: NSRange.init(location: 0, length: attributedText.length))
//
//       // If the label have text alignment. Delete this code if label have a default (left) aligment. Possible to add the attribute in previous adding.
//       let paragraphStyle = NSMutableParagraphStyle()
//       paragraphStyle.alignment = .center
//       mutableStr.addAttributes([NSAttributedString.Key.paragraphStyle : paragraphStyle], range: NSRange(location: 0, length: attributedText.length))
//
//       // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
//       let layoutManager = NSLayoutManager()
//       let textContainer = NSTextContainer(size: CGSize.zero)
//       let textStorage = NSTextStorage(attributedString: mutableStr)
//
//       // Configure layoutManager and textStorage
//       layoutManager.addTextContainer(textContainer)
//       textStorage.addLayoutManager(layoutManager)
//
//       // Configure textContainer
//       textContainer.lineFragmentPadding = 0.0
//       textContainer.lineBreakMode = label.lineBreakMode
//       textContainer.maximumNumberOfLines = label.numberOfLines
//       let labelSize = label.bounds.size
//       textContainer.size = labelSize
//
//       // Find the tapped character location and compare it to the specified range
//       let locationOfTouchInLabel = self.location(in: label)
//       let textBoundingBox = layoutManager.usedRect(for: textContainer)
//       let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
//                                         y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
//       let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x,
//                                                    y: locationOfTouchInLabel.y - textContainerOffset.y);
//       let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
//       return NSLocationInRange(indexOfCharacter, targetRange)
//   }
//
//}

extension UILabel {
    typealias MethodHandler = () -> Void
    func addRangeGesture(stringRange: String, function: @escaping MethodHandler) {
        RangeGestureRecognizer.stringRange = stringRange
        RangeGestureRecognizer.function = function
        self.isUserInteractionEnabled = true
        let tapgesture: UITapGestureRecognizer = RangeGestureRecognizer(target: self, action: #selector(tappedOnLabel(_ :)))
        tapgesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapgesture)
    }

    @objc func tappedOnLabel(_ gesture: RangeGestureRecognizer) {
        guard let text = self.text else { return }
        let stringRange = (text as NSString).range(of: RangeGestureRecognizer.stringRange ?? "")
        if gesture.didTapAttributedTextInLabel(label: self, inRange: stringRange) {
            guard let existedFunction = RangeGestureRecognizer.function else { return }
            existedFunction()
        }
    }
}

class RangeGestureRecognizer: UITapGestureRecognizer {
    // Stored variables
    typealias MethodHandler = () -> Void
    static var stringRange: String?
    static var function: MethodHandler?
  
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)
      
        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
      
        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        
        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
                                          y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x,
                                                     y: locationOfTouchInLabel.y - textContainerOffset.y);
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)

        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}
