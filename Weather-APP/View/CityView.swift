//
//  CityView.swift
//  Weather-APP
//
//  Created by sachiin verma on 05/04/21.
//

import SwiftUI

// now we wrapped all cityNameView, todayweatherView, hourlyWeatherView,DailyWeatherView into this cityView

struct CityView: View {
    //
    @ObservedObject var cityVM: CityViewViewModel
    var body: some View {
        VStack {
            CityNameView(city: cityVM.city, date: cityVM.date)
                .shadow(radius: 0)
            TodayWeatherView(cityVM: cityVM)
                .padding()
            HourlyWeatherView(cityVM: cityVM)
            DailyWeatherView(cityVM: cityVM)
        }.padding(.bottom)
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
