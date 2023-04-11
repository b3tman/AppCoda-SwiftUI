//
//  ContentView.swift
//  SwiftUIStacks
//
//  Created by Maxim Brishten on 11.04.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                PricingView(title: "Basic", price: "$9", textColor: .white, bgColor: .red)
                PricingView(title: "Pro", price: "$19", textColor: .white, bgColor: .green)
                    .scaleEffect(0.95)
                    .offset(y: -100)
                PricingView(title: "Team", price: "$299", textColor: .white, bgColor: .purple)
                    .scaleEffect(0.9)
                    .offset(y: -200)
            }
        }
        .padding()
//        VStack {
//            HeaderView()
//            HStack {
//                PricingView(title: "Basic", price: "$9", textColor: .white, bgColor: .purple)
//                ZStack(alignment: .bottom) {
//                    PricingView(title: "Pro", price: "$19", textColor: .black, bgColor: Color(red: 240/255, green: 240/255, blue: 240/255))
//                    Text("Best for designer")
//                        .font(.system(.caption, design: .rounded))
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                        .padding(5)
//                        .background(Color(red: 255/255, green: 183/255, blue: 37/255))
//                        .offset(y: 10)
//                }
//            }
//            ZStack(alignment: .bottom) {
//                PricingView(iconName: "wand.and.rays",
//                            title: "Team",
//                            price: "$299",
//                            textColor: .white,
//                            bgColor: Color(red: 62/255, green: 63/255, blue: 70/255))
//                Text("Perfect for teams with 20 members")
//                    .font(.system(.caption, design: .rounded))
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                    .padding(5)
//                    .background(Color(red: 255/255, green: 183/255, blue: 37/255))
//                    .offset(y: 10)
//            }
//            Spacer()
//        }
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2.0) {
                Text("Choose")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                Text("Your plan")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
            }
            .padding()
            Spacer()
        }

    }
}

struct PricingView: View {
    var iconName: String?
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color

    var body: some View {
        VStack {
            if let icon = iconName {
                Image(systemName: icon)
                    .font(.system(size: 30))
                    .foregroundColor(textColor)
            }
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundColor(textColor)
            Text("per month")
                .font(.headline)
                .foregroundColor(textColor)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
}
