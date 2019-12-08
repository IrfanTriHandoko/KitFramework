//
//  GITSPref.swift
//  GITSFramework
//
//  Created by GITS Indonesia on 3/14/17.
//  Copyright © 2017 GITS Indonesia. All rights reserved.
//

import Foundation
import SwiftyJSON
import GITSNetwork

public struct GITSPref {
    public static var KEY_LOGIN = "LOGIN"
    public static var KEY_PROFILE = "PROFILE"
    public static var KEY_DEVICE_TOKEN = "DEVICE_TOKEN"
    public static var KEY_PO = "KENDARAAN_UMUM_PO"
    public static var KEY_LIST_KENDARAAN_UMUM = "LIST_KENDARAAN_UMUM"
    public static var KEY_LIST_ESTIMATED = "KEY_LIST_ESTIMATED"
    public static var KEY_LIST_DAFTAR_PEMBAYARAN = "LIST_DAFTAR_PEMBAYARAN"
    public static var KEY_MY_TRIP = "MY_TRIP"
    public static var KEY_SHOW_TRIP = "SHOW_TRIP"
    public static var KEY_ITEM_ID = "ITEM_ID"
    public static var KEY_NOTIF_TYPE = "KEY_NOTIF_TYPE"
    public static var KEY_SOCMED = "SOCMED"
    public static var KEY_IWKBU_HP = "IWKBU_HP"
    public static var KEY_NOPOL = "NOPOL"
    public static var KEY_CREATE_TRIP = "CREATE_TRIP"
    public static var KEY_TRANS_TYPE = "TRANS_TYPE"
    public static var KEY_ROTATION_PDF = "ROTATION_PDF"
    public static var KEY_NOREK = "KEY_NOREK"
    // Phase 2
    public static var KEY_EDIT_PROFILE = "KEY_EDIT_PROFILE"
    public static var KEY_ACTIVATE_PROFILE = "KEY_ACTIVATE_PROFILE"
    public static var KEY_TOKEN_FINPAY = "KEY_TOKEN_FINPAY"
    public static var KEY_ACTIVATE_FINPAY = "KEY_ACTIVATE_FINPAY"
    public static var KEY_TRANSFER_PHONE = "KEY_TRANSFER_PHONE"
    public static var KEY_TRANSFER_PIN = "KEY_TRANSFER_PIN"
    public static var IS_ONBOARDING_IWKBU = "IS_ONBOARDING_IWKBU"
    public static var IS_LOGIN_IWKBU_STATE = "IS_LOGIN_IWKBU_STATE"
    public static var IS_VERIFIED_IWKBU = "IS_FINISH_IWKBU"
    
    static let pref = UserDefaults.standard
    
//    public static func saveObject(key:String ,value:AnyObject){
//        let data = NSKeyedArchiver.archiveData(with: value)
//        pref.set(data, forKey: key)
//        commit()
//    }
    
    public static func saveBool(key:String,value:Bool){
        pref.set(value, forKey: key)
        commit()
    }
    
    public static func saveInt(key:String,value:Int) {
        pref.set(value, forKey: key)
        commit()
    }
    
    public static func saveString(key:String,value:String) {
        pref.set(value, forKey: key)
        commit()
    }
    
    public static func commit(){
        pref.synchronize()
    }
    
    public static func remove(key:String) {
        pref.removeObject(forKey: key)
    }
    
    public static func getObject(key:String)->AnyObject?{
        if let data = pref.object(forKey: key) as? NSData {
            let obj = NSKeyedUnarchiver.unarchiveObject(with: data as Data)!
            return obj as AnyObject?
        }
        return nil
    }
    
    public static func getString(key:String) -> String{
        if let string = pref.string(forKey: key) {
            return string
        }
        return ""
    }
    
    public static func getBool(key:String) -> Bool {
        if pref.bool(forKey: key) {
            return pref.bool(forKey: key)
        }
        return false
    }
    
    public static func getInt(key:String) -> Int {
        return pref.integer(forKey: key)
    }
    
//    public static func getLogin() -> DAOLoginBaseClass? {
//        if let result = getObject(key: KEY_LOGIN) as? DAOLoginBaseClass {
//            return result
//        } else {
//            return nil
//        }
//    }
    
}
