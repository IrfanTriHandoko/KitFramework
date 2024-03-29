//
//  GITSUploadImage.swift
//  GITSFramework
//
//  Created by Tri Rejeki on 06/03/18.
//  Copyright © 2018 GITS Indonesia. All rights reserved.
//

import Foundation
import UIKit
import GITSNetwork

public class GITSUploadImage {

    static let IMAGE_URL = "\(GITSApps.GetURLV1())images/"

    public static func doUploadImage(image:UIImage, onSucces: @escaping (_ result:String) -> Void, onFailed: @escaping onError) {
//        GITSNet.uploadRequest(request: NetworkUploadPhoto.doUploadPhoto(), multipartFormData: { (multipart) in
//            self.reduceImage(image: image, onSuccess: { (image) in
//                let imageToUpload = image
//                multipart.append(UIImagePNGRepresentation(imageToUpload)!, withName: "image", fileName: "image.jpg", mimeType: "image/jpeg")
//            })
//        }, onSuccess: { (json) in
//            let res = DAOUploadImageBaseClass(json: json)
//            if res.code == 200 {
//                if let data: DAOUploadImageData = res.data {
//                    onSucces("\(data.uniqueId ?? "")")
//                }
//            }
//            else {
//                onFailed(res.message ?? "")
//            }
//        }) { (error) in
//            onFailed(error)
//        }
    }

    static func reduceImage(image: UIImage, onSuccess: @escaping (_ img: UIImage)->Void) {
        let imageToUpload = image.resizedImage()
        onSuccess(imageToUpload!)
    }

}


extension UIImage {
    func resizeWithPercentage(percentage: CGFloat) -> UIImage? {
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: size.width * percentage, height: size.height * percentage)))
        imageView.contentMode = .scaleAspectFit
        imageView.image = self
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return result
    }

    public func resizedImage() -> UIImage? {
        guard let imageData = self.pngData() else { return nil }

        var resizingImage = self
        var imageSizeKB = Double(imageData.count) / 1000.0 // ! Or devide for 1024 if you need KB but not kB

        while imageSizeKB > 1000 { // ! Or use 1024 if you need KB but not kB
            guard let resizedImage = resizingImage.resizeWithPercentage(percentage: 0.9),
                let imageData = resizedImage.pngData()
                else { return nil }

            resizingImage = resizedImage
            imageSizeKB = Double(imageData.count) / 1000.0 // ! Or devide for 1024 if you need KB but not kB
        }

        return resizingImage
    }
}
