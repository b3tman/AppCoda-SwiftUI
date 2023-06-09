//
//  ContentView.swift
//  SwiftUIText
//
//  Created by Maxim Brishten on 7.04.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("«Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma—which is living with the results of other people’s thinking. Don’t let the noise of others’ opinions drown out your own inner voice. And most important, have the courage to follow your heart and intuition.»")
                .fontWeight(.bold)
                .font(.custom("Nunito-Italic-VariableFont_wght", size: 20))
                .foregroundColor(.green)
                .multilineTextAlignment(.center)
                .truncationMode(.head)
                .lineSpacing(10)
                .padding()
                .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                .shadow(color: .gray, radius: 2, x: 0, y: 15)
            Text("**This is how you bold a text**. *This is how you make text italic.* You can [click this link](https://www.appcoda.com) to go to appcoda.com")
                .font(.title)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
