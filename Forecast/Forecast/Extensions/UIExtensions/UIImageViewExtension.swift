//
//  UIImageViewExtension.swift
//  Forecast
//
//  Created by KOiSPRK on 10/22/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func tintColor(color: UIColor) {
        guard let img = self.image else {
            return
        }
        self.image = img.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
    
    func round() {
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}
