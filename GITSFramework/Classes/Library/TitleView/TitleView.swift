//
//  TitleView.swift
//  GITSFramework
//
//  Created by GITS INDONESIA on 27/12/17.
//  Copyright © 2017 GITS Indonesia. All rights reserved.
//

import UIKit

public class TitleView: UIView {
    @IBOutlet weak var titleLbl: UILabel! //default
    @IBInspectable var title: String = "Title" //default
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.titleLbl.text = title
    }
    
    public func setTitle(title: String) {
        self.title = title
        self.titleLbl.text = self.title
    }
}

public extension TitleView {
    public class func instantiateFromNib() -> TitleView {
        return UINib(nibName: "TitleView", bundle: bundle).instantiate(withOwner: nil, options: [:])[0] as! TitleView
    }
    
    static var bundle:Bundle {
        let podBundle = Bundle(for: TitleView.self)
        let bundleURL = podBundle.url(forResource: "GITSFramework", withExtension: "bundle")
        if bundleURL == nil {
            return podBundle
        }else{
            return Bundle(url: bundleURL!)!
        }
    }
}
