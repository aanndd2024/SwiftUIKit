//
//  UIImage+Extension.swift
//  MVVM-ProductDetails
//
//  Created by Anand Yadav on 23-05-2024.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let resource = KF.ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}

