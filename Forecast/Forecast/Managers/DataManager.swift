
//
//  DataManager.swift
//  Forecast
//
//  Created by KOiSPRK on 10/24/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    var city:String = ""
    var countryCode:String = ""
    fileprivate var weather = Weather()
    
    func setWeather(with weather: Weather) {
        self.weather = weather
    }
    
    func getWeather() -> Weather {
        return self.weather
    }
    
}
