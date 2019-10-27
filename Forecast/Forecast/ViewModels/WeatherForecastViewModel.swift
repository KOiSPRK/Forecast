//
//  WeatherForecastViewModel.swift
//  Forecast
//
//  Created by KOiSPRK on 10/25/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import UIKit

class WeatherForecastViewModel: BaseViewModel {

    override init() {
        super.init()
    }
    
}

extension WeatherForecastViewModel {
    
   func getWeatherForecast() {
       APIManager.shared.getWeatherForecast(weather: self.weather, completion: { (weatherForecast, error) in
           self.forecast = weatherForecast.filter({ (weather) -> Bool in
            let dateFormat:String = "yyyy-MM-dd"
            return weather.dateTime?.toString(withFormat: dateFormat) == Date().toString(withFormat: dateFormat)
            /*
             NOTED: in case you want to see the whole day forecast of tomorrow,
                    you can uncomment the line below and change the date to your desire
             */
//            return weather.dateTime?.toString(withFormat: "yyyy-MM-dd") == "2019-10-29"
           })
       })
   }
    
}
