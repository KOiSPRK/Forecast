//
//  UIViewExtension.swift
//  Forecast
//
//  Created by KOiSPRK on 10/22/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit

extension UIView {
    
    class func loadFromNibNamed(nibNamed: String? = nil, bundle : Bundle? = nil) -> UIView? {
        if nibNamed != nil {
            return UINib(nibName: nibNamed!,bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? UIView
        }
        return UINib(nibName: String(describing: self),bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
    
    func addOuterShadowColor(_ color:UIColor, opacity:Float,radius:CGFloat,offset:CGSize){
        self.layer.masksToBounds = true
        self.layer.shadowOpacity = opacity
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = radius
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
}
