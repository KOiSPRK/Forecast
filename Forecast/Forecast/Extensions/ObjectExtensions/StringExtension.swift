//
//  StringExtension.swift
//  Forecast
//
//  Created by KOiSPRK on 10/22/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit

extension String {
    
    func capitalizingFirstLetter() -> String {
        let first = String(self.prefix(1)).capitalized
        let other = String(self.dropFirst())
        return first + other
    }
    
    func date(format: DateFormatter) -> Date? {
        return format.date(from: self)
    }
    
    func getAttributedBoldString(boldTxt : String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString.init(string: self)
        let boldedRange = NSRange(self.range(of: boldTxt)!, in: self)
        attrStr.addAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 22, weight: .bold)], range: boldedRange)
        return attrStr
    }
}
