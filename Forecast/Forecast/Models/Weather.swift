//
//  Weather.swift
//  Forecast
//
//  Created by KOiSPRK on 10/22/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit


class CountryCode: BaseModel {
    
    var code:String?
    
    override init() {
        super.init()
    }
    
    private enum CodingKeys: String, CodingKey {
        case code = "alpha2Code"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        try super.init(from: decoder)
        self.code = try? container.decode(String.self, forKey: .code)
        print(self.code)
    }
    
}


class Weather: BaseModel {
    
    var city:String?
    var unit:Unit?
    var temp:Double?
    var humidity:Double?
    var desc:String?
    var highestTemp:Double?
    var lowestTemp:Double?
    var dateTime:Date?
    
    override init() {
        super.init()
        self.unit = .celsius
    }
    
    private enum CodingKeys: String, CodingKey {
        case main
        case temp
        case humidity
        case weather
        case desc = "description"
        case highestTemp = "temp_max"
        case lowestTemp = "temp_min"
        case dateTime = "dt_txt"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        try super.init(from: decoder)
        let main = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .main)
        self.temp = try? main.decode(Double.self, forKey: .temp)
        self.humidity = try? main.decode(Double.self, forKey: .humidity)
        self.highestTemp = try? main.decode(Double.self, forKey: .highestTemp)
        self.lowestTemp = try? main.decode(Double.self, forKey: .lowestTemp)
        
        if let date = try? container.decode(String.self, forKey: .dateTime).date(format: Formatter.custom) {
            self.dateTime = date
        }
    }
    
}
struct Formatter {
    
    static var custom: DateFormatter {
        get {
            return DateFormatter.globalFormatter(with: "yyyy-MM-dd HH:mm:ss")
        }
    }
    
}
