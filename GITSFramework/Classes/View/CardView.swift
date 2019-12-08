//
//  CardView.swift
//  GITSFramework
//
//  Created by GITS INDONESIA on 14/01/18.
//  Copyright © 2018 GITS Indonesia. All rights reserved.
//

import UIKit

public class CardView: UIView {
    
    @IBInspectable var radius: CGFloat = 1 //default
    @IBInspectable var shadow: CGFloat = 1 //default
    
    override public func layoutSubviews() {
        layer.cornerRadius = radius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius)
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: shadow);
        layer.shadowOpacity = 0.4
        layer.shadowPath = shadowPath.cgPath
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}
