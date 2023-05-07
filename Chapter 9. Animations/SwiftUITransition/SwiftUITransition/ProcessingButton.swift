//
//  ProcessingButton.swift
//  SwiftUITransition
//
//  Created by Maxim Brishten on 7.05.23.
//

import SwiftUI

enum ButtonState: CustomStringConvertible {
    case original
    case processing
    case completed
    
    var description: String {
        switch self {
        case .original:
            return "Submit"
        case .processing:
            return "Processing"
        case .completed:
            return "Completed"
        }
    }
}

struct ProcessingButton: View {
    @State var buttonState: ButtonState = .original
    @State var isLoading = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .frame(width: buttonState == .processing ? 250 : 200, height: 60)
            .foregroundColor(buttonState == .completed ? .red : .green)
            .overlay {
                HStack(spacing: 10.0) {
                    if isLoading {
                        Loader()
                            .frame(width: 25, height: 25)
                            .transition(.opacity)
                    }
                    Text(buttonState.description)
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                    .fontWeight(.bold)
                }
            }
            .onTapGesture {
                startProcessing()
            }
            .animation(.default, value: buttonState)
    }
    
    private func startProcessing() {
        buttonState = .processing
        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.buttonState = .completed
            self.isLoading = false
        }
    }
}

struct ProcessingButton_Previews: PreviewProvider {
    static var previews: some View {
        ProcessingButton()
    }
}
