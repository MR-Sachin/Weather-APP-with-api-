//
//  WeatherResponse.swift
//  Weather-APP
//
//  Created by sachiin verma on 04/04/21.
//

import Foundation

struct WeatherResponse: Codable {
    var current:  Weather           //WeatherSubclass    
    var hourly: [Weather]
    var daily:[DailyWeather]
    
    
    // now we create a empty weather response state see blow code in horly we have 23 instance and for days 8 and api response we populated this empty values they just replace with value which come form api so they not gonna shrinking and colapsing
    
    static func empty()-> WeatherResponse {
        WeatherResponse(current: Weather(), hourly: [Weather](repeating: Weather(), count: 23), daily: [DailyWeather](repeating: DailyWeather(), count: 8))
    }
}
