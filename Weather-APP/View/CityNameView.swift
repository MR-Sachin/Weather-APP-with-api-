//
//  CityNameView.swift
//  Weather-APP
//
//  Created by sachiin verma on 05/04/21.
//

import SwiftUI

struct CityNameView: View {
    var city: String
    var date: String
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 10) {
            Text(city)
                .bold()
            Text(date)
            }.foregroundColor(.white)
        }
    }
}

struct CityNameView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
