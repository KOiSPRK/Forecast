//
//  CurrentViewModel.swift
//  Forecast
//
//  Created by KOiSPRK on 10/22/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit

class CurrentViewModel: BaseViewModel {

    func getCityName() -> String {
        guard !DataManager.shared.city.isEmpty else {
            return "Unknown"
        }
        return DataManager.shared.city.lowercased().capitalizingFirstLetter()
    }
    
    func getTemp() -> String {
        return self.displayString(with: self.weather.temp, isDegree: true)
    }
    
    func getHumidity() -> String {
        return self.displayString(with: self.weather.humidity)
    }
    
    func getHighestTemp() -> String {
        return self.displayString(with: self.weather.highestTemp, isDegree: true)
    }
    
    func getLowestTemp() -> String {
        return self.displayString(with: self.weather.lowestTemp, isDegree: true)
    }
    
    func getDate() -> String {
        return "Today, \(Date().toString(withFormat: "MMM d, yyyy"))"
    }
    
    
    // MARK: Private
    
    fileprivate func displayString(with value: Double?, isDegree:Bool = false) -> String {
        guard let val = value else {
            return "--"
        }
        return "\(String(Int(val)))\(isDegree ? "°" : "")"
    }
    
}

extension CurrentViewModel {
    
    func getWeather() {
        APIManager.shared.getWeather(weather: self.weather, completion: { (weather, error) in
            self.weather = weather
            DataManager.shared.setWeather(with: weather)
        })
    }
    
}
