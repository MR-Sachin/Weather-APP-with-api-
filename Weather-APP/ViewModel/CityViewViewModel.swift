//
//  CityViewViewModel.swift
//  Weather-APP
//
//  Created by sachiin verma on 04/04/21.
//

import Foundation
import SwiftUI
import CoreLocation  /// we use core location to extract cordinatres out of the address

final class CityViewViewModel: ObservableObject { // its gonna observable object so we can observe for the chenges when they happed whenevern our api return a response
    
    @Published var weather = WeatherResponse.empty() // weather oobject initailzed with empty that weather object we are published to our subscribre
    
    @Published var city: String = "Delhi" {
        didSet {
            //call get location here
            getLocation()
        }
    }
    
    // create 3 formater for date, day , time
    
    private lazy var dateFormatter: DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    private lazy var dayFormatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }()
    
    private lazy var timeFormatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        return formatter
    }()
    
    // initilizer for get location here
    
    init() {
        getLocation()
    }
    
    // now we gonna make some property which we need them and can return a formatter responce... when some ask for date which return in below formatter
    
    var date: String {
        dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.dt)))
    }
    
    var weatherIcon:String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "sun.max.fill"
    }
    
    var temperature:String {
        return getTempFor(temp: weather.current.temp)
    }
    
    var condition: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return ""
    }
    
    var humidity:String{
        return String(format: "%d%%", weather.current.humidity)
    }
    
    var windSpeed:String{
        return String(format: "%0.1f", weather.current.wind_speed)
        
    }
    
    var rainChances: String {
        return String(format: "%0.0f%%", weather.current.dew_point)
    }
    
    func getTimeFor(timestamp:Int) -> String {
        return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    
    func getTempFor(temp: Double) -> String {
        return String(format: "%0.1f", temp)
    }
    
    func getDayFor(timestamp:Int) -> String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    
    // we call network here for get location which convert search location string(delhi) into
    private func getLocation() {
        CLGeocoder().geocodeAddressString(city) { (placemarkes, error) in    // placemakes is used if delhi more then one mean collection those places
            if let places = placemarkes, let place = places.first {
                self.getWeather(coord: place.location?.coordinate)
            }
        }
    }
    
    
    
    //MARK: Network Call functions
    // now we use core location or geolocation to get the longitutde and latitude from the address that been given to us for that we creat a function that take coordinate
    
    private func getWeather(coord: CLLocationCoordinate2D?) {
        if let coord = coord {
             let urlString = API.getURLFor(lat: coord.latitude, lon: coord.longitude)
            
            // then call weather funtion
            getWeatherInternal(city: city, for: urlString)
        } else {
            //if coordinate not there
            let urlString = API.getURLFor(lat: 37.5485, lon: -121.9886)
            getWeatherInternal(city: city, for: urlString)
        }
    }
    
    
    // that function for make network call
    private func getWeatherInternal(city: String, for urlString: String) {
        NetworkManager<WeatherResponse>.fetch(for: URL(string: urlString)!) { (result) in
            switch result {
            // success case provide us response and wanna move to main thread
            case.success(let response):
                DispatchQueue.main.async {
                    // set weather object (that we have publish object) to response that we have received
                    self.weather = response
                }
                
            case.failure(let err):
                print(err)
            }
        }
        
    }
    
    
    
    // now we create 2 functions for lottie animation which we used for animation that function nature is static
    
    func getLottieAnimationFor(icon:String) -> String {
        switch icon {
        case "01d":
            return "dayClearSky"
        case "01n":
            return "NightClearSky"
        case "02d":
            return "dayFewCloud"
        case "02n":
            return "NightFewCloud"
        case "03d":
            return "dayScatteredCloud"
        case "03n":
            return "NightScatteredCloud"
        case "04d":
            return "dayBrokenCloud"
        case "04n":
            return "NightBrokenCloud"
        case "05d":
            return "dayShowerRains"
        case "05n":
            return "NighShowerRainst"
        case "09d":
            return "dayRain"
        case "09n":
            return "NightRain"
        case "10d":
            return "dayThunderstorm"
        case "10n":
            return "NightThunderStorm"
        case "11d":
            return "daySnow"
        case "11n":
            return "NightSnow"
        case "13d":
            return "dayMist"
        case "13n":
            return "NightMist"
        case "15d":
            return "day"
        case "15n":
            return "Night"
        case "50d":
            return "day"
        case "50n":
            return "Night"
            
        default:
           return "dayClearSky"
        }
    }
    
    
    func getWeatherIconFor(icon:String) -> Image  {
        switch icon {
        case "01d":
            return Image(systemName: "sun.max.fill") // clear_sky_day
        case "01n":
            return Image(systemName: "moon.fill")
        case "02d":
            return Image(systemName: "cloud.sun.fill") // __
        case "02n":
            return Image(systemName: "cloud.moon.fill")
        case "03d":
            return Image(systemName: "cloud.fill") // __
        case "03n":
            return Image(systemName: "cloud.fill")
        case "04d":
            return Image(systemName: "cloud.fill") // __
        case "04n":
            return Image(systemName: "cloud.fill")
        case "09d":
            return Image(systemName: "cloud.drizzle.fill") // __
        case "09n":
            return Image(systemName: "cloud.drizzle.fill")
        case "10d":
            return Image(systemName: "cloud.heavyrain.fill") // __
        case "10n":
            return Image(systemName: "cloud.heavyrainfill")
        case "11d":
            return Image(systemName: "cloud.bolt.fill") // __
        case "11n":
            return Image(systemName: "cloud.bolt.fill")
        case "13d":
                return Image(systemName: "cloud.snow.fill") // __
        case "13n":
                return Image(systemName: "cloud.snow.fill")
        case "50d":
            return Image(systemName: "cloud.fog.fill") // __
        case "50n":
            return Image(systemName: "cloud.fog.fill")
                
        default:
            return Image(systemName: "sun.max.fill")
        }
    }
    
    
}
