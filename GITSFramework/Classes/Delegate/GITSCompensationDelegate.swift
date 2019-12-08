//
//  GITSCompensationDelegate.swift
//  GITSCompensation
//
//  Created by GITS  on 07/02/18.
//  Copyright © 2018 GITS INDONESIA. All rights reserved.
//

import Foundation

public protocol GITSCompensationDelegate {
    func doSuccessSubmission()
    func doCloseSuccessSubmission()
    func doCloseToRiwayat()
    func doCloseToHome()
    func doSuccessNoPol(message:String)
    func doCloseToListSantunan()
}
