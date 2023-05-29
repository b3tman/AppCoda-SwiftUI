//
//  TitleBar.swift
//  SwiftUIBottomSheet
//
//  Created by Maxim Brishten on 29.05.23.
//

import SwiftUI

struct TitleBar: View {
    var body: some View {
        HStack {
            Text("Restaurant Details")
                .font(.headline)
                .foregroundColor(.primary)
            
            Spacer()
        }
        .padding()
    }
}

struct TitleBar_Previews: PreviewProvider {
    static var previews: some View {
        TitleBar()
    }
}
