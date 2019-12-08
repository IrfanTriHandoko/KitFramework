//
//  EmptyView.swift
//  GITSFramework
//
//  Created by GITS INDONESIA on 11/27/17.
//  Copyright © 2017 GITS Indonesia. All rights reserved.
//

import UIKit

public enum EmptyEnum {
    case review
    case product
    case message
}

open class EmptyView: UIView {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var hintLabel: UILabel!
    
    public func create(view: UIView, image: String, message: String, bgColor: String, hintColor: String) {
        backgroundColor = UIColor(bgColor)
        imageView.image = UIImage(named: image)
        hintLabel.text = message
        hintLabel.textColor = UIColor(hintColor)
        frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        view.addSubview(self)
    }
    
    public func removeView() {
        removeFromSuperview()
    }
}

public extension EmptyView {
    public class func instantiateFromNib() -> EmptyView {
        return UINib(nibName: "EmptyView", bundle: bundle).instantiate(withOwner: nil, options: [:])[0] as! EmptyView
    }
    
    static var bundle:Bundle {
        let podBundle = Bundle(for: EmptyView.self)
        let bundleURL = podBundle.url(forResource: "GITSFramework", withExtension: "bundle")
        if bundleURL == nil {
            return podBundle
        }else{
            return Bundle(url: bundleURL!)!
        }
    }
}
