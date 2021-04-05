//
//  MenuHeaderView.swift
//  Weather-APP
//
//  Created by sachiin verma on 05/04/21.
//

import SwiftUI

struct MenuHeaderView: View {
    @ObservedObject var cityVM:CityViewViewModel
    
    @State private var searchItem = "Delhi"
    var body: some View {
        HStack {
            TextField("", text: $searchItem)
                .padding(.leading, 20)
            Button {
                cityVM.city = searchItem
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                    
                    Image(systemName: "location.fill")
                }
            }
            .frame(width: 50, height: 50)
        }
        .foregroundColor(.white)
        .padding()
        .background(ZStack (alignment: .leading) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding(.leading)
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue.opacity(0.5))
        })
    }
}

struct MenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
