//
//  DailyWeatherView.swift
//  Weather-APP
//
//  Created by sachiin verma on 05/04/21.
//

import SwiftUI

struct DailyWeatherView: View {
    @ObservedObject var cityVM: CityViewViewModel
    var body: some View {
        
        ForEach(cityVM.weather.daily) { weather in
        LazyVStack {
            DailyCell(weather: weather)
        }
    }
}
        
        private func DailyCell(weather: DailyWeather) -> some View {
            HStack {
                Text(cityVM.getDayFor(timestamp: weather.dt).uppercased())
                    .frame(width: 50)
                
                Spacer()
                
                Text("\(cityVM.getTempFor(temp: weather.temp.max)) | \(cityVM.getTempFor(temp: weather.temp.min))℉")
                    .frame(width:150)
                Spacer()
                
                cityVM.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun-max-fill")
            }
            .foregroundColor(.white)
            .padding(.horizontal,40)
            .padding(.vertical, 15)
            .background(RoundedRectangle(cornerRadius: 5).fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5411764706, green: 0.7607843137, blue: 0.9764705882, alpha: 1)), Color(#colorLiteral(red: 0.4078431373, green: 0.5333333333, blue: 0.937254902, alpha: 1))]), startPoint: .topLeading, endPoint: .topTrailing)))
            .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
            .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
        }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
