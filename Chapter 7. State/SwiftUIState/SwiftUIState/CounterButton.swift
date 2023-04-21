//
//  CounterButton.swift
//  SwiftUIState
//
//  Created by Maxim Brishten on 21.04.23.
//

import SwiftUI

struct CounterButton: View {

    @Binding var counter: Int
    var color: Color

    var body: some View {
        Button {
            counter += 1
        } label: {
            Circle()
                .foregroundColor(color)
                .overlay {
                    Text("\(counter)")
                        .font(.system(size: 100, design: .rounded))
                        .foregroundColor(.white)
                }
        }
    }
}

struct CounterButton_Previews: PreviewProvider {
    static var previews: some View {
        CounterButton(counter: .constant(121), color: .red)
    }
}
