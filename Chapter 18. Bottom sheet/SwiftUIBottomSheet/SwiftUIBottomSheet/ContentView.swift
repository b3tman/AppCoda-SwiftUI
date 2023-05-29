//
//  ContentView.swift
//  SwiftUIBottomSheet
//
//  Created by Maxim Brishten on 29.05.23.
//

import SwiftUI

struct ContentView: View {
    @State private var lastSelectedDetend: PresentationDetent = .medium
    @State private var selectedRestaurant: Restaurant?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(restaurants) { restaurant in
                    BasicImageRow(restaurant: restaurant)
                        .onTapGesture {
                            self.selectedRestaurant = restaurant
                        }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Restaurants")
            .sheet(item: $selectedRestaurant) { restaurant in
                RestaurantDetailView(restaurant: restaurant)
                    .presentationDetents([.height(200), .medium, .large], selection: $lastSelectedDetend)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BasicImageRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
        }
    }
}
