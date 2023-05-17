//
//  BasicImageRow.swift
//  SwiftUIActionSheet
//
//  Created by Maxim Brishten on 17.05.23.
//

import SwiftUI

struct BasicImageRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
            Spacer()
            if restaurant.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(Color.yellow)
            }
        }
    }
}

struct BasicImageRow_Previews: PreviewProvider {
    static var previews: some View {
        BasicImageRow(restaurant: Restaurant.restaurants[0])
    }
}
