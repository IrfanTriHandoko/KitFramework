//
//  Loading.swift
//  PertaminaGO
//
//  Created by GITS on 8/19/16.
//  Copyright © 2016 GITS. All rights reserved.
//

import UIKit

open class MbloadingView: UIView {
    
    @IBOutlet var viewParent: UIView!
    @IBOutlet weak var progressActivity: UIActivityIndicatorView!
    @IBOutlet weak var errorMessageUI: UILabel!
    @IBOutlet weak var noConnectionView: UIView!
    @IBOutlet weak var noConnectionImg: UIImageView!
    
    func loadInView(view:UIView) {
        errorMessageUI.isHidden = true
        progressActivity.isHidden = false
        progressActivity.startAnimating()
        frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        view.addSubview(self)
    }
    
    func loadInView(view: UIView, isTransluscent: Bool) {
        viewParent.backgroundColor = isTransluscent == false ? UIColor("#E0E0E0")?.withAlphaComponent(1) : UIColor.white.withAlphaComponent(0.8)
        errorMessageUI.isHidden = true
        progressActivity.isHidden = false
        progressActivity.startAnimating()
        frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        view.addSubview(self)
    }
    
    func loadInButton(button: UIButton) {
        viewParent.backgroundColor = UIColor.clear
        progressActivity.color = UIColor.white
        errorMessageUI.isHidden = true
        progressActivity.isHidden = false
        progressActivity.startAnimating()
        frame = CGRect(x: 0, y: 0, width: button.frame.width, height: button.frame.height)
        button.addSubview(self)
    }
    
    func showEmptyData(message:String){
        errorMessageUI.isHidden = false
        progressActivity.isHidden = true
        progressActivity.stopAnimating()
        errorMessageUI.text = message
    }
    
    func showNoConnection(view: UIView, state: Bool, message: String) {
        progressActivity.stopAnimating()
        viewParent.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        noConnectionView.isHidden = !state
        errorMessageUI.isHidden = !state
        errorMessageUI.text = message
        if state == true {
            frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
            view.addSubview(self)
        } else {
            removeFromSuperview()
        }
    }
    
    func showProgressDialog(view: UIView, state: Bool, message: String) {
        progressActivity.stopAnimating()
        viewParent.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        noConnectionView.isHidden = !state
        noConnectionImg.image = UIImage(named: "ic_logout_popup")
        errorMessageUI.isHidden = !state
        errorMessageUI.text = message
        frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        view.addSubview(self)
    }
    
    func stop(){
        removeFromSuperview()
    }
}

public extension MbloadingView {
    public class func instantiateFromNib() -> MbloadingView {
        return UINib(nibName: "MbloadingView", bundle: bundle).instantiate(withOwner: nil, options: [:])[0] as! MbloadingView
    }
    
    static var bundle:Bundle {
        let podBundle = Bundle(for: MbloadingView.self)
        let bundleURL = podBundle.url(forResource: "GITSFramework", withExtension: "bundle")
        if bundleURL == nil {
            return podBundle
        }else{
            return Bundle(url: bundleURL!)!
        }
    }
}
