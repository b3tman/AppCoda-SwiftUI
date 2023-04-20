//
//  ContentView.swift
//  SwiftUIButton
//
//  Created by Maxim Brishten on 20.04.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button {
                print("Action")
            } label: {
                Text("Hello World")
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.purple)
                    .cornerRadius(40)
                    .font(.title)
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.purple, lineWidth: 5)
                    }
            }
            Button {
                print("Action")
            } label: {
                Label("Delete", systemImage: "trash")
            }
            .buttonStyle(GradientBackgroundStyle())

            Button {

            } label: {
                Text("Buy me a coffee")
            }
            .tint(.purple)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 5))
            .controlSize(.large)
        }
        .padding()
    }
}

struct GradientBackgroundStyle: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .font(.title)
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
