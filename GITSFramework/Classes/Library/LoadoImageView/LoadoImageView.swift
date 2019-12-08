//
//  LoadoImageView.swift
//  Tradepost
//
//  Created by AJIE ARGANATA on 10/11/17.
//  Copyright © 2017 GITS INDONESIA. All rights reserved.
//

import UIKit
import HexColors

extension UIImageView {
    
    //Start or Stop a loading view in an ImageView
    public func setLoad(isLoad: Bool, style: UIActivityIndicatorView.Style) {
        if isLoad {
            if subviews.count == 0 {
                let progress = UIActivityIndicatorView(style: style)
                progress.startAnimating()
                progress.color = UIColor("#2B333C")
                self.backgroundColor = UIColor("#E1E5EB")
                self.addSubview(progress)
                
                let xConstraint = NSLayoutConstraint(item: progress, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
                
                let yConstraint = NSLayoutConstraint(item: progress, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
                progress.translatesAutoresizingMaskIntoConstraints = false
                self.addConstraint(xConstraint)
                self.addConstraint(yConstraint)
            }
            
        } else {
            self.backgroundColor = UIColor.clear
            self.subviews.forEach{ $0.removeFromSuperview() }
        }
    }
}
