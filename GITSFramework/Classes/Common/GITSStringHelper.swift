//
//  StringHelper.swift
//  GITSFramework
//
//  Created by GITS INDONESIA on 11/24/17.
//  Copyright © 2017 GITS Indonesia. All rights reserved.
//

import Foundation
import UIKit

public class GITSStringHelper {
    public static func generateDeviceID()->String{
        //device id
        let deviceid = UIDevice.current.identifierForVendor?.uuidString
        return deviceid!
    }
    
    public static func isEmptyString(text: String)-> Bool {
        var status = true
        trimCharEmpty(text: text) { (trim) in
            let result = trim.components(separatedBy: " ")
            if result.count > 0 {
                for word in result {
                    if word.isEmpty {
                        status = false
                    }
                    if word != "" {
                        status = true
                    }
                }
            } else {
                status = false
            }
        }
        return status
    }
    
    static func trimCharEmpty(text: String, onSuccess: @escaping (_ result: String)-> Void) {
        if text.last == " " {
            var truncated = text
            truncated.removeLast()
            self.trimCharEmpty(text: truncated, onSuccess: onSuccess)
        } else {
            onSuccess(text)
        }
    }
    
    public static func isValidEmail(text:String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: text, options: [], range: NSRange(location: 0, length: text.count)) != nil
    }
    
    public static func isValidPhoneNumber(phoneNumber: String) -> Bool {
        let PHONE_REGEX = "^(08)[1-9]{1}[0-9]{8,14}+$"
        let mobileValidation = NSPredicate.init(format: "SELF MATCHES %@", PHONE_REGEX)
        return mobileValidation.evaluate(with: phoneNumber)
    }
    
    public static func isValidNoPol(type: String, value: String, min: Int, max: Int) -> Bool {
        switch type {
        case "ID_CODE":
            return self.isValidNumeric(value: value, min: min, max: max)
        default: // CITY AND DISTRICT CODE
            return self.isValidAlphabet(value: value)
        }
    }
    
    public static func isValidAlphabet(value: String) -> Bool {
        let REGEX = "(^[a-zA-Z ]*$)"
        let matches = NSPredicate(format: "SELF MATCHES %@", REGEX)
        let result =  matches.evaluate(with: value)
        return result
    }
    
    public static func isValidNumeric(value: String, min: Int, max: Int) -> Bool {
        let REGEX = "^[0-9]{\(min),\(max)}$"
        let matches = NSPredicate(format: "SELF MATCHES %@", REGEX)
        let result =  matches.evaluate(with: value)
        return result
    }
    
    public static func addNumberZero(text : String) -> String {
        if text.count < 5 {
            let zeroqty = 5 - text.count
            var zeroded : String = ""
            for _ in 1 ... zeroqty {
                zeroded = "\(zeroded)0"
            }
            return "\(zeroded)\(text)"
        } else {
            return text
        }
    }
    
    public static func bilangx(angka : Double) -> String{
        let nomina : [String] = ["","satu","dua","tiga","empat","lima","enam",
                                 "tujuh","delapan","sembilan","sepuluh","sebelas"]
        
        if(angka<12)
        {
            return nomina[Int(angka)];
        }
        
        if(angka>=12 && angka <= 19)
        {
            return nomina[Int(angka) % 10] + " belas ";
        }
        
        if(angka>=20 && angka <= 99)
        {
            return nomina[Int(angka) / 10] + " puluh " + nomina[Int(angka) % 10];
        }
        
        if(angka>=100 && angka <= 199)
        {
            let mod = Int(angka) % 100
            return "seratus " + bilangx(angka: Double(mod));
        }
        
        if(angka >= 200 && angka <= 999)
        {
            let mod = Int(angka) % 100
            return nomina[Int(angka) / 100] + " ratus " + bilangx(angka: Double(mod));
        }
        
        if(angka>=1000 && angka <= 1999)
        {
            let mod = Double(Int(angka) % 1000)
            return "seribu " + bilangx(angka: mod);
        }
        
        if(angka >= 2000 && angka <= 999999)
        {
            let mod = Double(Int(angka) % 1000)
            return bilangx(angka: Double(Int(angka) / 1000)) + " ribu " + bilangx(angka: mod);
        }
        
        if(angka >= 1000000 && angka <= 999999999)
        {
            let mod = Double(Int(angka) % 1000000)
            return bilangx(angka: Double((Int(angka) / 1000000))) + " juta " + bilangx(angka: mod);
        }
        
        return "";
    }
}

public extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType:  NSAttributedString.DocumentType.html], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    var htmlToAttributedString2: NSAttributedString? {
        do {
            let htmlCSSString = "<style>" +
                "html *" +
                "{" +
                "font-family: Helvetica !important;" +
                "}" +
                "p {" +
                "font-size: 13px;" +
                "font-family: Helvetica !important;" +
                "}" +
            "</style> \(self)"
            
            guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
                return nil
            }
            
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    public static func isValidNumeric(value: String, min: Int, max: Int) -> Bool {
        let REGEX = "^[0-9]{\(min),\(max)}$"
        let matches = NSPredicate(format: "SELF MATCHES %@", REGEX)
        let result =  matches.evaluate(with: value)
        return result
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
