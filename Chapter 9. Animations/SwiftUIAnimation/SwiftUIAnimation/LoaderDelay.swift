//
//  LoaderDelay.swift
//  SwiftUIAnimation
//
//  Created by Maxim Brishten on 7.05.23.
//

import SwiftUI

struct LoaderDelay: View {
    @Binding var isLoading: Bool
    
    var body: some View {
        HStack {
            ForEach(0...4, id: \.self) { index in
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.green)
                    .scaleEffect(self.isLoading ? 0 : 1)
                    .animation(.linear(duration: 0.6).repeatForever().delay(0.2 * Double(index)), value: isLoading)
            }
        }
    }
}

struct LoaderDelay_Previews: PreviewProvider {
    static var previews: some View {
        LoaderDelay(isLoading: .constant(true))
    }
}
