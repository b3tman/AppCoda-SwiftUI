//
//  RecordButton.swift
//  SwiftUIAnimation
//
//  Created by Maxim Brishten on 7.05.23.
//

import SwiftUI

struct RecordButton: View {
    @Binding var recordBegin: Bool
    @Binding var recording: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: recordBegin ? 30 : 5)
                .frame(width: recordBegin ? 60 : 250, height: 60)
                .foregroundColor(recordBegin ? .red : .green)
                .overlay(
                    Image(systemName: "mic.fill")
                        .font(.system(.title))
                        .foregroundColor(.white)
                        .scaleEffect(recording ? 0.7 : 1)
                )
            
            RoundedRectangle(cornerRadius: recordBegin ? 35 : 10)
                .trim(from: 0, to: recordBegin ? 0.0001 : 1)
                .stroke(lineWidth: 5)
                .frame(width: recordBegin ? 70 : 260, height: 70)
                .foregroundColor(.green)
            
        }
        .onTapGesture {
            withAnimation(Animation.spring()) {
                self.recordBegin.toggle()
            }
            
            withAnimation(Animation.spring().repeatForever().delay(0.5)) {
                self.recording.toggle()
            }
        }
    }
}

struct RecordButton_Previews: PreviewProvider {
    static var previews: some View {
        RecordButton(recordBegin: .constant(false), recording: .constant(false))
    }
}
