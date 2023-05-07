//
//  ContentView.swift
//  SwiftUIAnimation
//
//  Created by Maxim Brishten on 7.05.23.
//

import SwiftUI

struct ContentView: View {
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    @State private var isLoading = false
    @State private var progress: CGFloat = 0.0
    @State private var recordBegin = false
    @State private var recording = false
    
    var body: some View {
//        ZStack {
//            Circle()
//                .frame(width: 200, height: 200)
//                .foregroundColor(circleColorChanged ? Color(.systemGray5) : .red)
//            Image(systemName: "heart.fill")
//                .foregroundColor(heartColorChanged ? .red : .white)
//                .font(.system(size: 100))
//                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
//        }
//        .onTapGesture {
//            withAnimation {
//                circleColorChanged.toggle()
//                heartColorChanged.toggle()
//                heartSizeChanged.toggle()
//            }
//        }
        VStack {
            Loader(progress: $progress)
            LoaderDelay(isLoading: $isLoading)
            RecordButton(recordBegin: $recordBegin, recording: $recording)
        }
        .onAppear {
            self.isLoading = true
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                self.progress += 0.05
                if self.progress > 1.0 {
                    timer.invalidate()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
