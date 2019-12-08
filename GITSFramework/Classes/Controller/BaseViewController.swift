//
//  BaseViewController.swift
//  GITSFramework
//
//  Created by GITS Indonesia on 3/14/17.
//  Copyright © 2017 GITS Indonesia. All rights reserved.
//

import UIKit
import SwiftMessages
import UIViewController_KeyboardAnimation
import HexColors
import SDWebImage


open class BaseViewController: UIViewController {
    
    public var performDelegate: GITSPerformDelegate?
    public var loadingView: MbloadingView?
    public var emptyView: EmptyView?
    public var statusBarView: UIView?
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emptyView = EmptyView.instantiateFromNib()
        //configBackButton()
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - Config General View
extension BaseViewController {
    
    open func configStatusBar() {
        if #available(iOS 13.0, *) {
            statusBarView = UIApplication.shared.value(forKey: "statusBar") as? UIView
        } else {
            let tag: Int = 987654321
            if let statusBar = UIApplication.shared.keyWindow?.viewWithTag(tag) {
                statusBarView = statusBar
            } else {
                let statusBar = UIView(frame: UIApplication.shared.statusBarFrame)
                statusBar.tag = tag
                UIApplication.shared.keyWindow?.addSubview(statusBar)
                statusBarView = statusBar
            }
        }
        if statusBarView?.responds(to: #selector(setter: UIView.backgroundColor)) ?? false {
            statusBarView?.backgroundColor = UIColor("#297EC1")
        }
    }
    
    open func configTitleView(title: String) {
        let titleView = TitleView.instantiateFromNib()
        titleView.setTitle(title: title)
        self.navigationItem.titleView  = titleView
    }
    
    open func configTransparantBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
    }
    
    open func configNavBar(color: String) {
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor(color)
        self.navigationController?.navigationBar.barTintColor = UIColor(color)
        self.navigationController?.navigationBar.backgroundColor = UIColor(color)
    }
    
    open func configNavBarAttribut(tintColor: String, titleColor: String) {
        navigationController?.navigationBar.tintColor = UIColor(tintColor)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(titleColor)!]
    }
    
    open func configNavbarWithImage(image: String) {
        let logo = UIImage(named: image)
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
    }
    
    open func configBackButton(){
        let buttonItem = UIBarButtonItem(image: UIImage(named: "ic_back_button"), style: UIBarButtonItem.Style.plain, target: self, action:#selector(didTapBackButton))
        self.navigationItem.leftBarButtonItem = buttonItem
        self.navigationItem.leftBarButtonItem?.imageInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0);
    }
    
    open func configBackRootButton(){
        let buttonItem = UIBarButtonItem(image: UIImage(named: "ic_back_button"), style: UIBarButtonItem.Style.plain, target: self, action:#selector(didTapBackRootButton))
        self.navigationItem.leftBarButtonItem = buttonItem
        self.navigationItem.leftBarButtonItem?.imageInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0);
    }
    
    @objc open func didTapBackButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc open func didTapBackRootButton() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    open func configButton(state: Bool, button: UIButton) {
        if state == true {
            button.isEnabled = true
            button.backgroundColor = UIColor("297FC3")!
        } else {
            button.isEnabled = false
            button.backgroundColor = UIColor("D8D8D8")!
        }
    }
    
    open func setupLoading(state: Bool, button: UIButton, title: String) {
        if state == true {
            showLoading(button: button)
        } else {
            stopLoading(isError: false, message: "")
        }
        let text = state == true ? "" : title
        button.setTitle(text, for: .normal)
    }
}

// MARK: - Show Message
extension BaseViewController {
    open func showMessage(message: String, error: Bool) {
        createMessage(message: message, error: error)
    }
    
    open func showMessage(view: UIView?, message: String, error: Bool) {
        if message.contains("Tidak ada koneksi internet") == false {
            createMessage(message: message, error: error)
        } else {
            loadingView?.showNoConnection(view: view ?? UIView(), state: true, message: NETWORK_ERROR)
        }
    }
    
    func createMessage(message: String, error: Bool) {
        let view = MessageView.viewFromNib(layout: .messageView)
        view.configureContent(title: "", body: message, iconImage: nil, iconText:"", buttonImage: nil, buttonTitle: "", buttonTapHandler: nil)
        view.tapHandler = { _ in
            SwiftMessages.hide()
        }
        view.configureDropShadow()
        view.button?.isHidden = true
        if error {
            view.configureTheme(.error, iconStyle: .light)
        } else {
            view.configureTheme(.success, iconStyle: .light)
        }
        
        var config = SwiftMessages.defaultConfig
        config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        config.presentationStyle = .top
        config.duration = .seconds(seconds: TimeInterval(3.5))
        config.interactiveHide = true
        SwiftMessages.hideAll()
        SwiftMessages.show(config: config, view: view)
    }
}

// MARK: - Show Loading/Progress View
extension BaseViewController {
    
    open func showLoading(view: UIView){
        loadingView = MbloadingView.instantiateFromNib()
        loadingView?.loadInView(view: view)
        if #available(iOS 13.0, *) {
            // TODO: - Handle For iOS 13
        } else {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
    open func showLoading(view: UIView, isTranslucent: Bool) {
        loadingView = MbloadingView.instantiateFromNib()
        loadingView?.loadInView(view: view, isTransluscent: isTranslucent)
        if #available(iOS 13.0, *) {
            // TODO: - Handle For iOS 13
        } else {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
    open func showLoading(button: UIButton) {
        loadingView = MbloadingView.instantiateFromNib()
        loadingView?.loadInButton(button: button)
        if #available(iOS 13.0, *) {
            // TODO: - Handle For iOS 13
        } else {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
    open func showLoadNet(){
        if #available(iOS 13.0, *) {
            // TODO: - Handle For iOS 13
        } else {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
    open func stopLoadNet(){
        if #available(iOS 13.0, *) {
            // TODO: - Handle For iOS 13
        } else {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
    open func stopLoading(isError: Bool, message: String){
        loadingView?.stop()
        if #available(iOS 13.0, *) {
            // TODO: - Handle For iOS 13
        } else {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
    open func showNoConnection(view: UIView?, void: Void?) {
        loadingView?.stop()
        if Reachability.isConnectedToNetwork() == true {
            loadingView?.showNoConnection(view: view ?? UIView(), state: false, message: "")
            // call function
            if let rec = void { rec }
        } else {
            loadingView?.showNoConnection(view: view ?? UIView(), state: true, message: NETWORK_ERROR)
        }
    }
    
    open func showLogoutDialog(view: UIView?) {
        loadingView?.showProgressDialog(view: view ?? UIView(), state: true, message: TextConstant.LOGOUT_PROGRESS)
    }
    
    open func showEmptyView(view: UIView, image: String, message: String, bgColor: String, hintColor: String) {
        emptyView?.create(view: view, image: image, message: message, bgColor: bgColor, hintColor: hintColor)
    }
    
    open func removeEmptyView() {
        emptyView?.removeFromSuperview()
    }
}

// MARK: - Manage Keyboard on Scroll View
extension BaseViewController{
    open func keyboardScrollView(_ scrollView: UIScrollView){
        self.an_subscribeKeyboard(animations: {frame,interval,opening in
            self.view.layoutIfNeeded()
            if(opening){
                scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: frame.height, right: 0)
            }else{
                scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }
        }, completion: nil)
    }
    
    open func keyboardViewUp(constraint : NSLayoutConstraint, defaultConst: CGFloat){
        self.an_subscribeKeyboard(animations: { (frame, interval, opening) in
            if opening{
                constraint.constant = -frame.height
            } else {
                constraint.constant = defaultConst
            }
        }, completion: nil)
    }
    
    open func keyboardViewUp(constraint : NSLayoutConstraint, defaultConst: CGFloat, updateCons: CGFloat){
        self.an_subscribeKeyboard(animations: { (frame, interval, opening) in
            if opening{
                constraint.constant = updateCons
            } else {
                constraint.constant = defaultConst
            }
        }, completion: nil)
    }
    
    open func keyboardViewCenter(superView: UIView, constraint: NSLayoutConstraint, defaultConst: CGFloat){
        self.an_subscribeKeyboard(animations: { (frame, interval, opening) in
            if opening{
                constraint.constant = -((superView.frame.height/2)-frame.height)
            }else{
                constraint.constant = defaultConst
            }
        }, completion: nil)
    }
    
    open func removeKeyboardScrollView(){
        self.an_unsubscribeKeyboard()
    }
}

// MARK: - Reconnecting API
extension BaseViewController {
    
    open func addNotifCenter(selector: Selector) {
        removeNotifCenter()
        NotificationCenter.default.addObserver(self, selector: selector, name: Notification.Name(TextConstant.RECONNECTING), object: nil)
    }
    
    open func removeNotifCenter() {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: Register Cell on Table View
extension BaseViewController {
    
    open func registerCell(tableView: UITableView, cellID: [String]) {
        for id in cellID {
            tableView.register(UINib(nibName: id, bundle: nibBundle), forCellReuseIdentifier: id)
        }
    }
}
