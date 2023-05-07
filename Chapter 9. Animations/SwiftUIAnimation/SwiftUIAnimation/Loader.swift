//
//  Loader.swift
//  SwiftUIAnimation
//
//  Created by Maxim Brishten on 7.05.23.
//

import SwiftUI

struct Loader: View {
//    @Binding var isLoading: Bool
    @Binding var progress: CGFloat
    
    var body: some View {
//        ZStack {
//            Circle()
//                .stroke(lineWidth: 20)
//                .frame(width: 100, height: 100)
//                .foregroundColor(Color.gray)
//            Circle()
//                .trim(from: 0, to: 0.7)
//                .stroke(Color.green, lineWidth: 5)
//                .frame(width: 100, height: 100)
//                .rotationEffect(Angle(degrees: isLoading ? 0 : 360))
//                .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: isLoading)
//                .onAppear {
//                    isLoading = true
//            }
        //        }
        
//        ZStack {
//            Text("Loading")
//                .font(.system(.body, design: .rounded))
//                .bold()
//                .offset(x: 0, y: -25)
//
//            RoundedRectangle(cornerRadius: 3)
//                .stroke(Color(.systemGray5), lineWidth: 3)
//                .frame(width: 250, height: 3)
//
//            RoundedRectangle(cornerRadius: 3)
//                .stroke(Color.green, lineWidth: 3)
//                .frame(width: 30, height: 3)
//                .offset(x: isLoading ? 110 : -110, y: 0)
//                .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isLoading)
//        }
//        .onAppear() {
//            self.isLoading = true
//        }
        ZStack {
            Text("\(Int(progress * 100))%")
                .font(.system(.title, design: .rounded))
                .bold()
            
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 10)
                .frame(width: 150, height: 150)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.green, lineWidth: 10)
                .frame(width: 150, height: 150)
                .rotationEffect(Angle(degrees: -90))
        }
        .animation(.default, value: progress)
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader(progress: .constant(0.5))
    }
}
