//
//  ImageViewExtension.swift
//  Pods
//
//  Created by GITS Indonesia on 3/17/17.
//
//

import Foundation
import UIKit

extension UIImage {
    public var circle: UIImage? {
        let square = CGSize(width: min(size.width, size.height), height: min(size.width, size.height))
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: square))
        imageView.contentMode = .scaleAspectFill
        imageView.image = self
        imageView.layer.cornerRadius = square.width/2
        imageView.layer.masksToBounds = true
        UIGraphicsBeginImageContext(imageView.bounds.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
}

extension UIImage {
    public var uncompressedPNGData: Data      { return self.pngData()!        }
    public var highestQualityJPEGNSData: Data { return self.jpegData(compressionQuality: 1.0)!  }
    public var highQualityJPEGNSData: Data    { return self.jpegData(compressionQuality: 0.75)! }
    public var mediumQualityJPEGNSData: Data  { return self.jpegData(compressionQuality: 0.5)!  }
    public var lowQualityJPEGNSData: Data     { return self.jpegData(compressionQuality: 0.25)! }
    public var lowestQualityJPEGNSData:Data   { return self.jpegData(compressionQuality: 0.0)!  }
}

extension UIImage {
    public class func colorForNavBar(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}

extension UIImage {
    public convenience init(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in:UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: image!.cgImage!)
    }
}

