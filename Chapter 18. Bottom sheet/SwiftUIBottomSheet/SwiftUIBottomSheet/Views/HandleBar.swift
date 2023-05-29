//
//  HandleBar.swift
//  SwiftUIBottomSheet
//
//  Created by Maxim Brishten on 29.05.23.
//

import SwiftUI

struct HandleBar: View {
    var body: some View {
        Rectangle()
            .frame(width: 50, height: 5)
            .foregroundColor(Color(.systemGray3))
            .cornerRadius(10)
    }
}

struct HandleBar_Previews: PreviewProvider {
    static var previews: some View {
        HandleBar()
    }
}
