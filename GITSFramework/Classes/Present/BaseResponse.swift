//
//  BaseResponse.swift
//  GITSFramework
//
//  Created by GITS Indonesia on 3/14/17.
//  Copyright © 2017 GITS Indonesia. All rights reserved.
//

import Foundation

public protocol BaseResponse : class {
    func displayError(message:String,object:Any)
}
