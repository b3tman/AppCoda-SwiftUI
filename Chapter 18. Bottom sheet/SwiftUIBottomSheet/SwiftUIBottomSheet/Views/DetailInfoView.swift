//
//  DetailInfoView.swift
//  SwiftUIBottomSheet
//
//  Created by Maxim Brishten on 29.05.23.
//

import SwiftUI

struct DetailInfoView: View {
    let icon: String?
    let info: String
    
    var body: some View  {
        HStack {
            if icon != nil {
                Image(systemName: icon!)
                    .padding(.trailing, 10)
            }
            Text(info)
                .font(.system(.body, design: .rounded))
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct DetailInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DetailInfoView(icon: "map", info: "Info description")
    }
}
