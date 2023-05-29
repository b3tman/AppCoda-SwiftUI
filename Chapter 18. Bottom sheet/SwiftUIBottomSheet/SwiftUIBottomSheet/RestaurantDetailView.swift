//
//  RestaurantDetailView.swift
//  SwiftUIBottomSheet
//
//  Created by Maxim Brishten on 29.05.23.
//

import SwiftUI

struct RestaurantDetailView: View {
    let restaurant: Restaurant
    
    var body: some View {
        VStack {
//            Spacer()
//            HandleBar()
            ScrollView(.vertical) {
                TitleBar()
                HeaderView(restaurant: self.restaurant)
                
                DetailInfoView(icon: "map", info: self.restaurant.location)
                    .padding(.top)
                DetailInfoView(icon: "phone", info: self.restaurant.phone)
                DetailInfoView(icon: nil, info: self.restaurant.description)
                    .padding(.top)
            }
        }
        .background(Color.white)
        .cornerRadius(10, antialiased: true)
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: restaurants[0])
    }
}
