//
//  APIManager.swift
//  Forecast
//
//  Created by KOiSPRK on 10/22/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    
    func getWeatherForecast(weather:Weather, completion: @escaping ([Weather], Error?) -> ()) {
        
        guard let url = URL(string: "\(Constant.baseUrl)/forecast?q=\(DataManager.shared.city),\(DataManager.shared.countryCode)&APPID=\(Constant.apiKey)&units=\(weather.unit?.rawValue ?? Unit.celsius.rawValue)") else {
            return
        }
        print("URL: \(url)")
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let result = Parse.parseJSONWeatherForecast(from: data), error == nil else {
                print("error=\(error?.localizedDescription ?? "Unknown Error")")
                return
            }
            completion(result, error)
        }
        task.resume()
    }
    
    func getWeather(weather:Weather, completion: @escaping (Weather, Error?) -> ()) {
        
        guard let url = URL(string: "\(Constant.baseUrl)/weather?q=\(DataManager.shared.city)&APPID=\(Constant.apiKey)&units=\(weather.unit?.rawValue ?? Unit.celsius.rawValue)") else {
            return
        }
        print("URL: \(url)")
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let result = Parse.parseJSONWeather(from: data), error == nil else {
                print("error=\(error?.localizedDescription ?? "Unknown Error")")
                return
            }
            result.city = DataManager.shared.city
            result.unit = weather.unit
            completion(result, error)
        }
        task.resume()
    }
    
}
