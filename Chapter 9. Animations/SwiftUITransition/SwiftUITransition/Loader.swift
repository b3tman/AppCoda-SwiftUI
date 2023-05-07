//
//  Loader.swift
//  SwiftUITransition
//
//  Created by Maxim Brishten on 7.05.23.
//

import SwiftUI

struct Loader: View {
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(Color.white, lineWidth: 3)
                .rotationEffect(Angle(degrees: isLoading ? 0 : 360))
                .animation(.linear.repeatForever(autoreverses: false), value: isLoading)
                .onAppear {
                    self.isLoading = true
                }
        }
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader()
    }
}
