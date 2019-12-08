//
//  GITSRootPerformDelegate.swift
//  GITSFramework
//
//  Created by Tri Rejeki on 30/01/18.
//  Copyright © 2018 GITS Indonesia. All rights reserved.
//

import Foundation

public protocol SuccessStepDelegate {
    func didClose()
}

extension SuccessStepDelegate {
    public func didClose(){}
}

public protocol BottomSheetDelegate {
    // Type => 0: More Menu, 1: Transfer Menu
    func showMore(type: Int)
    func showPage(menu: String, type: Int)
}

extension BottomSheetDelegate {
    public func showMore(type: Int){}
    public func showPage(menu: String, type: Int){}
}

public protocol IWKBUFinishDelegate {
    func finishPage(state: Int)
}

extension IWKBUFinishDelegate {
    public func finishPage(state: Int){}
}
