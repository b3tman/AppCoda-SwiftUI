//
//  ContentView.swift
//  SwiftUIState
//
//  Created by Maxim Brishten on 21.04.23.
//

import SwiftUI

struct ContentView: View {
    @State private var redCount = 0
    @State private var yellowCount = 0
    @State private var greenCount = 0

    var body: some View {
        VStack {
            Text("\(redCount + yellowCount + greenCount)")
                .font(.system(size: 200, design: .rounded))
                .fontWeight(.bold)
            HStack {
                CounterButton(counter: $redCount, color: .red)
                CounterButton(counter: $yellowCount, color: .yellow)
                CounterButton(counter: $greenCount, color: .green)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
