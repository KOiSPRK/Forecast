//
//  Date.swift
//  Forecast
//
//  Created by KOiSPRK on 10/22/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit

extension Date {
    
    static func fromString(format:String,stringValue:String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let date = dateFormatter.date(from: stringValue)
        return date
        
    }
    
    public func toString(withFormat format:String = "MMMM dd, yyyy") -> String {
        let dateFormater:DateFormatter = DateFormatter()
        dateFormater.dateFormat = format
        return dateFormater.string(from: self)
    }
    
}
