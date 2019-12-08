//
//  UITextFieldExtension.swift
//  GITSFramework
//
//  Created by GITS INDONESIA on 30/01/18.
//  Copyright © 2018 GITS Indonesia. All rights reserved.
//

import UIKit

public extension UITextField {
    @IBInspectable var placeholderColor: UIColor {
        get {
            return attributedPlaceholder?.attribute(.foregroundColor, at: 0, effectiveRange: nil) as? UIColor ?? UIColor.clear
        }
        set {
            let attributes: [NSAttributedString.Key : UIColor] = [.foregroundColor : newValue]
            attributedPlaceholder = NSAttributedString(string: attributedPlaceholder?.string ?? "", attributes: attributes)
        }
    }
    
    func configTextField() {
        self.layer.cornerRadius = 3
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor("#212121")?.withAlphaComponent(0.5).cgColor
    }
    
    func configFieldPadding(left: CGFloat, right: CGFloat) {
        let paddingLeftView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: self.frame.height))
        let paddingRightView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: self.frame.height))
        self.leftView = paddingLeftView
        self.leftViewMode = UITextField.ViewMode.always
        self.rightView = paddingRightView
        self.rightViewMode = UITextField.ViewMode.always
    }
    
    func setIKWBUFormStyle(leftPad: Int, rightPad: Int){
        self.configTextField()
        self.configFieldPadding(left: CGFloat(leftPad), right: CGFloat(rightPad))
    }
}

