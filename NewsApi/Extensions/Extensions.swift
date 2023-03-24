//
//  Extensions.swift
//  NewsApi
//
//  Created by Salih on 24.03.2023.
//

import Foundation
import UIKit

extension UIImageView {
    
  
        func addShadowAndRoundedCorners(cornerRadius: CGFloat, shadowColor: UIColor = UIColor.black, shadowOffset: CGSize = CGSize(width: 0.0, height: 2.0), shadowOpacity: Float = 0.7, shadowRadius: CGFloat = 2.0) {
            self.layer.masksToBounds = false
            self.layer.cornerRadius = cornerRadius
            self.layer.shadowColor = shadowColor.cgColor
            self.layer.shadowOffset = shadowOffset
            self.layer.shadowOpacity = shadowOpacity
            self.layer.shadowRadius = shadowRadius
        }
   

}

