//
//  UITableViewCellExtension.swift
//  Forecast
//
//  Created by KOiSPRK on 10/22/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    class func identifier() -> String {
        return String(describing: self)
    }
}
