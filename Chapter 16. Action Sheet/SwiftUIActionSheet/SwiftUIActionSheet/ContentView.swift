//
//  ContentView.swift
//  SwiftUIActionSheet
//
//  Created by Maxim Brishten on 17.05.23.
//

import SwiftUI

struct ContentView: View {
    
    @State var restaurants = Restaurant.restaurants
    @State private var selectedRestaurant: Restaurant?
    
    var body: some View {
        List {
            ForEach(restaurants) { restaurant in
                BasicImageRow(restaurant: restaurant)
                    .onTapGesture {
                        self.selectedRestaurant = restaurant
                    }
                    .actionSheet(item: $selectedRestaurant, content: { restaurant in
                        ActionSheet(title: Text("What do you want to do"), message: nil, buttons: [

                            .default(Text("Mark as Favorite"), action: {
                                self.setFavorite(item: restaurant)
                            }),

                            .destructive(Text("Delete"), action: {
                                self.delete(item: restaurant)
                            }),

                            .cancel()
                        ])
                    })
            }
            .onDelete { (indexSet) in
                self.restaurants.remove(atOffsets: indexSet)
            }
        }
        .listStyle(.plain)
    }
    
    private func delete(item restaurant: Restaurant) {
        if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.restaurants.remove(at: index)
        }
    }
    
    private func setFavorite(item restaurant: Restaurant) {
        if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.restaurants[index].isFavorite.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
