//
//  Parse.swift
//  Forecast
//
//  Created by KOiSPRK on 10/22/19.
//  Copyright © 2019 KOi. All rights reserved.
//

import Foundation

struct Parse {
    
    static func jsonGenericObject<T: Decodable>(with responses:[String:Any], type: T.Type) -> T? {
        guard let jsonData = try? responses.data(),
            let result = try? JSONDecoder().decode(T.self, from: jsonData) else {
                return nil
        }
        return result
    }
    
    
    static func jsonGenericDictArray<T: Decodable>(with responses:[String:Any], type: [T].Type) -> [T]? {
        var array:[T] = []
        if let data = responses["list"] as? [[String: Any]] {
            array = data.compactMap({ (item) -> T? in
                Parse.jsonGenericObject(with: item, type: T.self)
            })
        }
        return array
    }
    
    static func parseJSONWeatherForecast(from data: Data) -> [Weather]? {
           do {
               guard let json = try data.jsonObject(),
                   let weatherForecast = self.jsonGenericDictArray(with: json, type: [Weather].self) else {
                       return nil
               }
               return weatherForecast
               
           } catch {
               print("Couldn't parse JSON: \(error)")
               if let utf8String = String(data: data, encoding: String.Encoding.utf8) {
                   print("Received: \(utf8String)")
               }
           }
           
           return nil
       }
    
    static func parseJSONWeather(from data: Data) -> Weather? {
        do {
            guard let json = try data.jsonObject(),
                let weather = self.jsonGenericObject(with: json, type: Weather.self) else {
                    return nil
            }
            return weather
            
        } catch {
            print("Couldn't parse JSON: \(error)")
            if let utf8String = String(data: data, encoding: String.Encoding.utf8) {
                print("Received: \(utf8String)")
            }
        }
        
        return nil
    }
    
}
