//
//  GITSNet.swift
//  GITSFramework
//
//  Created by GITS Indonesia on 3/16/17.
//  Copyright © 2017 GITS Indonesia. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SystemConfiguration
import GITSNetwork

let SUCCESS = "success"
public let NETWORK_ERROR = "Tidak ada koneksi internet.\nMohon periksa perangkat Anda"
let SYSTEM_ERROR = "Terjadi kesalahan sistem"

public typealias onError = (_ message: String)-> Void

extension GITSRestError {
    var message : String {
        switch self {
        case .serverFailure( _, let message):
            return message
        case .timeout:
            return "Request timeout"
        case .unauthorized:
            return "Unauthorized"
        case .unknown:
            return "Oops! Something went wrong..."
        }
    }
}

public struct GITSNet {
    
//    public static func getToken()-> String {
//        if let token = GITSPref.getLogin()?.token, token != "" {
//            return token
//        } else {
//            return "feb8ea0e1b2ab2b2ab534665ff5019bd2ebc154a"
//        }
//    }

    public static func request (
        request:URLRequestConvertible,
        onSuccess:@escaping (_ response:JSON) -> Void,
        onFailure:@escaping (_ response:String) -> Void) {
        
        let req:URLRequest?
        do {
            req = try request.asURLRequest()
        } catch  {
            req = nil
        }
        
        _ = GITSRest.runRequest(urlRequest: req!, jsonValidation: { json in
            return nil
        }) { error,json in
            if error == nil {
                print("JSON Result => \(String(describing: json!))" )
                if json!["message"] == "access token error, please login again" {
                    print("AutoLogout..")
                    GITSPref.remove(key: GITSPref.KEY_PROFILE)
                    GITSPref.remove(key: GITSPref.KEY_PO)
                    GITSPref.remove(key: GITSPref.KEY_DEVICE_TOKEN)
                    GITSPref.remove(key: GITSPref.KEY_LIST_KENDARAAN_UMUM)
                    GITSPref.remove(key: GITSPref.KEY_LIST_DAFTAR_PEMBAYARAN)
                    GITSPref.remove(key: GITSPref.KEY_MY_TRIP)
                    GITSPref.remove(key: GITSPref.KEY_SHOW_TRIP)
                    GITSPref.remove(key: GITSPref.KEY_ITEM_ID)
                    GITSPref.remove(key: GITSPref.KEY_SOCMED)
                    GITSPref.remove(key: GITSPref.KEY_LOGIN)
                    GITSPref.remove(key: GITSPref.KEY_IWKBU_HP)
                    onFailure("Session Anda berakhir, Silahkan login kembali.")
                }else{
                    onSuccess(json!)
                }
            }else if let err = error {
                print("JSON Error => \(err.message)" )
                if Reachability.isConnectedToNetwork() == true {
                    onFailure("Terjadi Kesalahan Server, Silakan coba beberapa saat lagi.")
                } else {
                    onFailure(NETWORK_ERROR)
                }
            }
        }
        
    }
    
    public static func uploadRequest(
        request: URLRequestConvertible,
        multipartFormData: @escaping (MultipartFormData) -> Void,
        onSuccess:@escaping (_ response:JSON) -> Void,
        onFailure:@escaping (_ response:String) -> Void) {
        let req:URLRequest?
        do {
            req = try request.asURLRequest()
        } catch  {
            req = nil
        }
        
        upload(multipartFormData: multipartFormData, with: req!) { (encodingResult) in
            switch encodingResult {
            case .success(let upload, _, _ ):
                upload.responseJSON {
                    response in
                    if response.result.error == nil {
                        let json = JSON(response.result.value!)
                        print(json)
                        print("=====RESPONSE JSON=====")
                        onSuccess(json)
                    } else{
                        onFailure("Oops! No internet found. Check your connection or try again.")
                    }
                }
            case .failure(let encodingError):
                print("===Failure Encoding===")
                print(encodingError)
                onFailure(encodingError.localizedDescription)
            }
        }
    }
}

public class Reachability {
    
    public class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        /* Only Working for WIFI
         let isReachable = flags == .reachable
         let needsConnection = flags == .connectionRequired
         
         return isReachable && !needsConnection
         */
        
        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)
        
        return ret
        
    }
}
