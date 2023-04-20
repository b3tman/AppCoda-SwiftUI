//
//  CardView.swift
//  SwiftUIScrollView
//
//  Created by Maxim Brishten on 20.04.23.
//

import SwiftUI

struct CardView: View {

    var image: String
    var category: String
    var heading: String
    var author: String

    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                VStack(alignment: .leading) {
                    Text(category)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(heading)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                    Text(author.uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        }
        .padding([.top, .horizontal])
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: "swiftui-button",
                 category: "SwiftUI",
                 heading: "Drawing a border with rounded borders",
                 author: "Written by simon ng".uppercased())
    }
}
