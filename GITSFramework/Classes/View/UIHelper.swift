//
//  ViewExtension.swift
//  GITSFramework
//
//  Created by GITS INDONESIA on 4/12/17.
//  Copyright © 2017 GITS Indonesia. All rights reserved.
//

import UIKit

public class UIHelper {
    
    public static func toast(message:String,vc:UIViewController){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: UIAlertController.Style.alert)
        vc.present(alert, animated: true, completion: nil)
        let duration:TimeInterval = 1; // duration in seconds
        let time = DispatchTime.now().uptimeNanoseconds
        let tes = UInt64(duration * Double(NSEC_PER_SEC))
        let jum = time + tes
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.init(uptimeNanoseconds: jum)) {
            vc.dismiss(animated: true, completion: nil)
        }
        
    }
}

public extension UITextView {
    
    func setIWKBUFormStyle(top: Int, left: Int, bottom: Int, right: Int) {
        self.layer.cornerRadius = 3
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor("#212121")?.withAlphaComponent(0.5).cgColor
        self.textContainerInset = UIEdgeInsets(top: CGFloat(top), left: CGFloat(left), bottom: CGFloat(bottom), right: CGFloat(right))
    }
}

public extension UIButton {
    
    func setIWKBUHistoryFilterStyle(isActive: Bool) {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 0.5
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        if isActive == true {
            self.backgroundColor = UIColor("#E0EEFF")
            self.setTitleColor(UIColor("#297FC3"), for: .normal)
            self.layer.borderColor = UIColor("#297FC3")?.withAlphaComponent(0.5).cgColor
        } else {
            self.backgroundColor = UIColor("#F6F6F6")
            self.setTitleColor(UIColor("#212121")?.withAlphaComponent(0.8), for: .normal)
            self.layer.borderColor = UIColor("#212121")?.withAlphaComponent(0.5).cgColor
        }
    }
    
    func setIWKBUStyle(radius: CGFloat, bgColor: String, borderWidth: CGFloat, borderColor: String) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.backgroundColor = UIColor(bgColor)?.cgColor
        self.layer.borderColor = UIColor(borderColor)?.cgColor
    }
    
    func setEnableStyle(state: Bool) {
        if state == true {
            self.isEnabled = true
            self.backgroundColor = UIColor("297FC3")!
        } else {
            self.isEnabled = false
            self.backgroundColor = UIColor("D8D8D8")!
        }
    }
}


