//
//  FormatCurrency.swift
//  GITSSubServiceDetail
//
//  Created by IRFAN TRIHANDOKO on 4/19/17.
//  Copyright © 2017 IRFAN TRIHANDOKO. All rights reserved.
//

import Foundation

extension Double {
    public func toRupiah() -> String{
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencySymbol = "Rp"
        currencyFormatter.locale = NSLocale(localeIdentifier: "id_ID") as Locale?
        return currencyFormatter.string(from: self as NSNumber)?.replacingOccurrences(of: ",00", with: "") ?? ""
    }
}
