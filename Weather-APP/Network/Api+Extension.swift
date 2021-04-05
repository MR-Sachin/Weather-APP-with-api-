//
//  Api+Extension.swift
//  Weather-APP
//
//  Created by sachiin verma on 04/04/21.
//

import Foundation

extension API {
    static let baseURLString = "https://api.openweathermap.org/data/2.5"
    
    //now create static function that give us url            that formate which we return in geturl func with add base url onecall?lat={lat}&lon={lon}&exclude={part}&appid={API key
    
    static func getURLFor(lat: Double, lon: Double) -> String {
        return "\(baseURLString)onecall?lat=\(lat)&lon=\(lon)&exclude=mintely&appid=\(key)&units=imperial"
    }
}
