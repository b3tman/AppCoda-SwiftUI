//
//  ContentView.swift
//  SwiftUIForm
//
//  Created by Maxim Brishten on 16.05.23.
//

import SwiftUI

struct ContentView: View {
    
    @State var restaurants = Restaurant.restaurants
    @State private var selectedRestaurant: Restaurant?
    @State private var showSettings: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(restaurants) { restaurant in
                    BasicImageRow(restaurant: restaurant)
                        .contextMenu {
                            
                            Button(action: {
                                // mark the selected restaurant as check-in
                                self.checkIn(item: restaurant)
                            }) {
                                HStack {
                                    Text("Check-in")
                                    Image(systemName: "checkmark.seal.fill")
                                }
                            }
                            
                            Button(action: {
                                // delete the selected restaurant
                                self.delete(item: restaurant)
                            }) {
                                HStack {
                                    Text("Delete")
                                    Image(systemName: "trash")
                                }
                            }
                                             
                            Button(action: {
                                // mark the selected restaurant as favorite
                                self.setFavorite(item: restaurant)
                                
                            }) {
                                HStack {
                                    Text("Favorite")
                                    Image(systemName: "star")
                                }
                            }
                        }
                        .onTapGesture {
                            self.selectedRestaurant = restaurant
                        }
                }
                .onDelete { (indexSet) in
                    self.restaurants.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Restaurant")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.showSettings = true
                    }, label: {
                        Image(systemName: "gear").font(.title2)
                            .foregroundColor(.black)
                    })
                }
            }
            .sheet(isPresented: $showSettings) {
                SettingsView()
            }
        }
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
    
    private func checkIn(item restaurant: Restaurant) {
        if let index = self.restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            self.restaurants[index].isCheckIn.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
