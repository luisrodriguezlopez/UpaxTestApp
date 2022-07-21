//
//  imageCache.swift
//  UpaxTestApp
//
//  Created by coppel on 20/07/22.
//

import Foundation

import UIKit
import Kingfisher

extension UIImageView {
    
     func setupImage(imageUrl: String) {
        if let imageURL  =  URL(string: imageUrl) {
            let resultImage = ImageResource(downloadURL: imageURL, cacheKey: imageUrl)
            self.kf.setImage(with: resultImage, placeholder: UIImage(named: "no-photo"))
        } else {
            self.image = UIImage(named: "no-photo")
        }
    }

    
}
