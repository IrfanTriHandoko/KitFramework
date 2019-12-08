//
//  DateHelper.swift
//  GITSFramework
//
//  Created by GITS Indonesia on 3/14/17.
//  Copyright © 2017 GITS Indonesia. All rights reserved.
//

import Foundation

public class GITSDateHelper {
    public static func dateParseToString(_ date: String, oldFormat: String, newFormat: String)-> String{
        let dateFormatter = DateFormatter()
        var newDateString = ""
        dateFormatter.dateFormat = oldFormat
        dateFormatter.locale = Locale(identifier: "id")
        if let mydate = dateFormatter.date(from: date){
            dateFormatter.dateFormat = newFormat
            newDateString = dateFormatter.string(from: mydate)
        }
        return newDateString
    }
    
    public static func getLocalGMT(date: Date) -> String {
        var zoneStr: String?
        let timeZone = DateFormatter().timeZone.secondsFromGMT(for: date)/3600
        switch timeZone {
        case 7:
            zoneStr = "WIB"
        case 8:
            zoneStr = "WITA"
        case 9:
            zoneStr = "WIT"
        default:
            zoneStr = "-"
        }
        return zoneStr ?? "-"
    }
    
    public static func dateParseToStringUTC(_ date: String, oldFormat: String, newFormat: String)-> String {
        let dateFormatter = DateFormatter()
        var newDateString = ""
        dateFormatter.dateFormat = oldFormat
        dateFormatter.locale = Locale(identifier: "id")
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        if let mydate = dateFormatter.date(from: date){
            dateFormatter.dateFormat = newFormat
            newDateString = dateFormatter.string(from: mydate)
        }
        return newDateString
    }
    
    public static func dateParseToString(_ date: Date, newFormat: String)-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = newFormat
        dateFormatter.timeZone = TimeZone(abbreviation: "ZE7")
        dateFormatter.locale = Locale(identifier: "id_ID")
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    public static func dateParseToStringUTC(_ date: Date, newFormat: String)-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = newFormat
        dateFormatter.locale = Locale(identifier: "id")
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    public static func stringToDate(date: String, format: String) -> Date {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "id_ID")
//        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        let date: Date = dateFormatter.date(from: date) ?? Date()
        return date
    }
    
    public static func stringToDateUTC(date: String, format: String) -> Date {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "id")
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        return dateFormatter.date(from: date) ?? Date()
    }
    
    public static func countMonth(date: String, format: String, value: Int) -> String {
        let dateD: Date = stringToDateUTC(date: date, format: format)
        if let dateValue = Calendar.current.date(byAdding: .month, value: value, to: dateD) {
            return self.dateParseToStringUTC(dateValue, newFormat: format)
        }
        return "Error Date: \(date)"
    }
    
    public static func timeAgoStringFrom(date: String, format: String) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        let dateResult = dateFormat.date(from: date)
        
        if dateResult != nil {
            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .full
            
            let now = Date()
            
            let calendar = Calendar.current
            let components = calendar.dateComponents(Set<Calendar.Component>([.year, .month, .weekOfMonth, .day, .hour, .minute, .second]), from: dateResult!, to: now)
            
            var isMonth = false
            var isYear = false
            var isYesterday = false
            
            if components.year! > 0 {
                isYear = true
                dateFormat.dateFormat = "MMM dd, yyyy"
                formatter.allowedUnits = .year
            } else if components.month! > 0 {
                isMonth = true
                dateFormat.dateFormat = "MMM dd"
                formatter.allowedUnits = .month
            } else if components.weekOfMonth! > 0 {
                formatter.allowedUnits = .weekOfMonth
            } else if components.day! > 0 {
                formatter.allowedUnits = .day
                if components.day! == 1 {
                    isYesterday = true
                }
            } else if components.hour! > 0 {
                formatter.allowedUnits = .hour
            } else if components.minute! > 0 {
                formatter.allowedUnits = .minute
            } else {
                formatter.allowedUnits = .second
            }
            
            let formatString = NSLocalizedString("%@ ago", comment: "Used to say how much time has passed. e.g. '2 hours ago'")
            
            guard let timeString = formatter.string(from: components) else {
                return "Error"
            }
            
            if isMonth || isYear {
                return dateFormat.string(from: dateResult!)
            } else if isYesterday {
                return "Yesterday"
            } else {
                return String(format: formatString, timeString)
            }
        } else {
            return "Error Date"
        }
    }
    
    public static func timeAgoStringFromV2(date: String, format: String) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        let dateResult = dateFormat.date(from: date)
        
        if dateResult != nil {
            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .full
            
            let now = Date()
            
            let calendar = Calendar.current
            let components = calendar.dateComponents(Set<Calendar.Component>([.year, .month, .weekOfMonth, .day, .hour, .minute, .second]), from: dateResult!, to: now)
            
            var isMonth = false
            var isMoreThanWeek = false
            var isYear = false
            var isYesterday = false
            var isToday = false
            
            if components.year! > 0 {
                isYear = true
                dateFormat.dateFormat = "MMM dd, yyyy"
            } else if components.month! > 0 {
                isMonth = true
                dateFormat.dateFormat = "MMM dd"
            } else if components.weekOfMonth! > 0 {
                formatter.allowedUnits = .weekOfMonth
                if components.weekOfMonth! > 1 {
                    isMoreThanWeek = true
                    dateFormat.dateFormat = "MMM dd"
                }
            } else if components.day! > 0 {
                formatter.allowedUnits = .day
                if components.day! == 1 {
                    isYesterday = true
                }
            } else {
                isToday = true
                dateFormat.dateFormat = "h:mm a"
            }
            
            let formatString = NSLocalizedString("%@ ago", comment: "Used to say how much time has passed. e.g. '2 hours ago'")
            
            guard let timeString = formatter.string(from: components) else {
                return "Error"
            }
            
            if isMonth || isYear || isToday || isMoreThanWeek {
                return dateFormat.string(from: dateResult!)
            } else if isYesterday {
                return "Yesterday"
            } else {
                return String(format: formatString, timeString)
            }
        } else {
            return "Error Date"
        }
    }
}

extension Date {
    
    func isEqualTo(_ date: Date) -> Bool {
        return self == date
    }
    
    func isGreaterThan(_ date: Date) -> Bool {
        return self > date
    }
    
    func isSmallerThan(_ date: Date) -> Bool {
        return self < date
    }
}
