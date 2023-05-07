//
//  ContentView.swift
//  SwiftUIShape
//
//  Created by Maxim Brishten on 7.05.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        ZStack {
//            Path { path in
//                path.move(to: CGPoint(x: 70, y: 200))
//                path.addLine(to: CGPoint(x: 120, y: 200))
//                path.addQuadCurve(to: CGPoint(x: 290, y: 200),
//                                  control: CGPoint(x: 205, y: 120))
//                path.addLine(to: CGPoint(x: 340, y: 200))
//                path.addLine(to: CGPoint(x: 340, y: 240))
//                path.addLine(to: CGPoint(x: 70, y: 240))
//            }
//            .fill(Color.green)
//            Path { path in
//                path.move(to: CGPoint(x: 70, y: 200))
//                path.addLine(to: CGPoint(x: 120, y: 200))
//                path.addQuadCurve(to: CGPoint(x: 290, y: 200),
//                                  control: CGPoint(x: 205, y: 120))
//                path.addLine(to: CGPoint(x: 340, y: 200))
//                path.addLine(to: CGPoint(x: 340, y: 240))
//                path.addLine(to: CGPoint(x: 70, y: 240))
//                path.closeSubpath()
//            }
//            .stroke(Color.red, lineWidth: 5)
//            Path { path in
//                path.move(to: CGPoint(x: 100, y: 300))
//                path.addArc(center: CGPoint(x: 100, y: 300),
//                            radius: 50,
//                            startAngle: Angle(degrees: 90),
//                            endAngle: Angle(degrees: 360),
//                            clockwise: true)
//            }
//            .fill(Color.red)
//        }
//        ZStack {
//            Path { path in
//                path.move(to: CGPoint(x: 170, y: 300))
//                path.addArc(center: CGPoint(x: 170, y: 300),
//                            radius: 130,
//                            startAngle: Angle(degrees: 0),
//                            endAngle: Angle(degrees: 200),
//                            clockwise: true)
//            }
//            .fill(Color.yellow)
//            Path { path in
//                path.move(to: CGPoint(x: 170, y: 300))
//                path.addArc(center: CGPoint(x: 170, y: 300),
//                            radius: 130,
//                            startAngle: Angle(degrees: 200),
//                            endAngle: Angle(degrees: 100),
//                            clockwise: true)
//            }
//            .fill(Color.teal)
//            Path { path in
//                path.move(to: CGPoint(x: 170, y: 300))
//                path.addArc(center: CGPoint(x: 170, y: 300),
//                            radius: 130,
//                            startAngle: Angle(degrees: 100),
//                            endAngle: Angle(degrees: 90),
//                            clockwise: true)
//            }
//            .fill(Color.blue)
//            Path { path in
//                path.move(to: CGPoint(x: 170, y: 300))
//                path.addArc(center: CGPoint(x: 170, y: 300),
//                            radius: 130,
//                            startAngle: Angle(degrees: 90),
//                            endAngle: Angle(degrees: 0),
//                            clockwise: true)
//            }
//            .fill(Color.purple)
//            .overlay {
//                Text("25%")
//                    .font(.system(size: 30))
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                    .offset(x: 30, y: -17)
//            }
//            .offset(x: 10, y: 10)
//            Path { path in
//                path.move(to: CGPoint(x: 170, y: 300))
//                path.addArc(center: CGPoint(x: 170, y: 300),
//                            radius: 130,
//                            startAngle: Angle(degrees: 90),
//                            endAngle: Angle(degrees: 0),
//                            clockwise: true)
//                path.closeSubpath()
//            }
//            .stroke(Color.black, lineWidth: 5)
//            .offset(x: 10, y: 10)
        //        }
//        ZStack {
//            Path { path in
//                path.move(to: CGPoint(x: 70, y: 200))
//                path.addQuadCurve(to: CGPoint(x: 270, y: 200),
//                                  control: CGPoint(x: 170, y: 180))
//                path.addRect(CGRect(x: 70, y: 200, width: 200, height: 40))
//            }
//            .fill(Color.green)
//        }
//        Button {
//            print("")
//        } label: {
//            Text("Dome")
//                .foregroundColor(.white)
//                .frame(width: 200, height: 100)
        //                .background(Dome().fill(Color.red))
        //        }
        ZStack {
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 20)
                .frame(width: 300, height: 300)
            Circle()
                .trim(from: 0, to: 0.85)
                .stroke(Color.purple, lineWidth: 20)
                .frame(width: 300, height: 300)
                .overlay {
                    VStack {
                        Text("85%")
                            .font(.system(size: 80, weight: .bold, design: .rounded))
                            .foregroundColor(.gray)
                        Text("Complete")
                            .font(.system(.body, design: .rounded))
                            .bold()
                            .foregroundColor(.gray)
                    }
                }
        }
    }
}

struct Dome: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width, y: 0),
                          control: CGPoint(x: rect.size.width/2, y: -(rect.size.width * 0.2)))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))

        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
