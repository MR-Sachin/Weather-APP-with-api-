//
//  DailyWeather.swift
//  Weather-APP
//
//  Created by sachiin verma on 04/04/21.
//

import Foundation

// if have any dought that way you can see weather object there we define all things

struct DailyWeather: Codable, Identifiable {
    
    var dt:Int
    var temp:Temperature
    var weather:[WeatherDetail]
    
    enum CodingKey: String {
        case dt
        case temp
        case weather
    }
    init() {
        dt = 0
        temp = Temperature(min: 0.0, max: 0.0)
        weather = [WeatherDetail(main: "", description: "", icon: "")]
    }
    
}

extension DailyWeather {
    var id: UUID {
    return UUID()
    }
}

