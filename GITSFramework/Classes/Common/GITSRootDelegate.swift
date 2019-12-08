//
//  GITSRootDelegate.swift
//  GITSFramework
//
//  Created by GITS INDONESIA on 05/01/18.
//  Copyright © 2018 GITS Indonesia. All rights reserved.
//

import Foundation

public protocol GITSRootDelegate {
    func doBecomeActive()
    func doDidEnterBackground()
    func doTryAgain()
}


extension GITSRootDelegate {
    public func doBecomeActive(){}
    public func doDidEnterBackground(){}
    public func doTryAgain(){}
}
