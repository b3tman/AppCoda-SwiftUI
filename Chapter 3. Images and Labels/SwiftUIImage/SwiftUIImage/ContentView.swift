//
//  ContentView.swift
//  SwiftUIImage
//
//  Created by Maxim Brishten on 10.04.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Image("paris")
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .overlay(alignment: .top, content: {
//                Text("«If you are lucky enough to have lived in Paris as a young man, then wherever you go for the rest of your life it stays with you, for Paris is a moveable feast.\n\n- Ernest Hemingway»")
//                    .fontWeight(.heavy)
//                    .foregroundColor(Color.white)
//                    .padding()
//                    .background(Color.black)
//                    .cornerRadius(10)
//                    .opacity(0.8)
//                    .padding()
//            })
//        Image("paris")
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .overlay {
//                Rectangle()
//                    .foregroundColor(Color.black)
//                    .opacity(0.4)
//        }
        Image("paris")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .overlay {
                Color.black.opacity(0.4)
                    .overlay(alignment: .top, content: {
                        Text("Paris")
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                            .padding()
                    })
                    .overlay(alignment: .topTrailing) {
                        Image(systemName: "cloud.sun.rain")
                            .font(.system(size: 50))
                            .padding()
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.indigo, .yellow, .gray)
                    }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
