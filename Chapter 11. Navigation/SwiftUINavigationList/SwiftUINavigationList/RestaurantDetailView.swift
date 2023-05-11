//
//  RestaurantDetailView.swift
//  SwiftUINavigationList
//
//  Created by Maxim Brishten on 11.05.23.
//

import SwiftUI

struct RestaurantDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    var restaurant: Restaurant
    
    var body: some View {
        VStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("\(Image(systemName: "chevron.left")) \(restaurant.name)")
                        .foregroundColor(.black)
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RestaurantDetailView(restaurant: Restaurant(name: "Homei", image: "homei"))
        }
    }
}
