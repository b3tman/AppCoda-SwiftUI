//
//  ContentView.swift
//  SwiftUITransition
//
//  Created by Maxim Brishten on 7.05.23.
//

import SwiftUI

struct ContentView: View {
    @State private var show = false
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundColor(.purple)
                .overlay(
                    Text("Well, here is the details")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white))
            if show {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundColor(.green)
                    .overlay(
                        Text("Show details")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundColor(.white))
                    .transition(.asymmetric)
            }
        }
        .onTapGesture {
            withAnimation {
                self.show.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension AnyTransition {
    static var offsetScaleOpacity: AnyTransition {
        AnyTransition.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity)
    }
    
    static var asymmetric: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .offset(x: -600, y: 0),
            removal: .opacity)
    }
}
