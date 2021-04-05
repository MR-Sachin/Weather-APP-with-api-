//
//  Weather.swift
//  Weather-APP
//
//  Created by sachiin verma on 04/04/21.
//

import Foundation

struct Weather: Codable, Identifiable {  // idetifiable protocol bez we need that in order to swiftUI to recognize each record individually
    var dt: Int           // we can make that optional Int? if value no there it just egnor them but we
    var temp: Double
    var feel_like: Double
    var pressure: Int
    var humidity: Int
    var dew_point: Double
    var clouds:Int
    var wind_speed: Double
    var wind_deg: Int
    var weather:[WeatherDetail]
    
    
    // if we have make above as optional we have not any issue if some value missing it just egnor them but we have issue with id it may happned  that we can run into issue with id
    // so what are gonna to do in order to avoid that we also going to provide -enum for coding key this gives you to another opportunity
    
    enum CodingKey: String {
        case dt    // if you like to change name dateXYZ = dt
        case temp
        case feel_like
        case pressure
        case humidity
        case dew_point
        case clouds
        case wind_speed
        case wind_deg
        case weather
        
        // now our weather object is ready
    }
    
    // for empty case; empty weather values for all those value assing to 0
        init() {
            
             dt = 0
             temp   = 0.0
             feel_like = 0.0
             pressure = 0
             humidity = 0
             dew_point = 0.0
             clouds = 0
             wind_speed = 0.0
             wind_deg = 0
             weather = []
        }
    
}

    extension Weather {
       var id: UUID {  // computed property for id so this id not passed by the services itself so we're gonna to make it computed property. that way swift know while decoding it doesnt need to decode this id bez it computed property
         return UUID()
      }
}


// if you want show sunset and sunrise and want to used api parameter of sunrise and sunset create class instead of sturture bez when we call all property for avoiding repeation we need inherite all those which we can doing in class not structure like that way

//class WeatherSubclass: Weather {
//    var sunset: Int
//    var sunrise: Int
//}
