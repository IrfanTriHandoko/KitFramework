//
//  GITSPerformDelegate.swift
//  GITSFramework
//
//  Created by GITS INDONESIA on 30/01/18.
//  Copyright © 2018 GITS Indonesia. All rights reserved.
//

import Foundation
import UIKit

public protocol GITSPerformDelegate {
    // AUTH
    func doLoginWithParam(vc: UIViewController, perform: GITSPerformDelegate?, data:[String: Any?])
   
}

extension GITSPerformDelegate {
    // AUTH
    public func doLoginWithParam(vc: UIViewController, perform: GITSPerformDelegate?,data: [String: Any?]){}
}

