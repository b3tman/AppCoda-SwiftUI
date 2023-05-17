//
//  ContentView.swift
//  SwiftUIGestures
//
//  Created by Maxim Brishten on 17.05.23.
//

import SwiftUI

struct ContentView: View {
    
    //LongPressGesture
//    @State private var isPressed = false
    @GestureState private var longPressTap = false
    
    //DragGesture
    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero
    
    // Combine gestures
//    @GestureState private var dragState = DragState.inactive
    @GestureState private var isPressed = false
    
    var body: some View {
        
        //LongPressGesture
        
//        Image(systemName: "star.circle.fill")
//            .font(.system(size: 200))
//            .foregroundColor(.green)
//            .scaleEffect(isPressed ? 0.5 : 1.0)
//            .opacity(longPressTap ? 0.4 : 1.0)
//            .animation(.easeInOut, value: isPressed)
//            .gesture(
//                LongPressGesture(minimumDuration: 1.0)
//                    .updating($longPressTap, body: { currentState, state, transaction in
//                        state = currentState
//                    })
//                    .onEnded({ _ in
//                        self.isPressed.toggle()
//                    })
//            )
        
        //DragGesture
        
//        Image(systemName: "star.circle.fill")
//            .font(.system(size: 100))
//            .offset(x: position.width + dragOffset.width, y: position.height + dragOffset.height)
//            .animation(.easeInOut, value: dragOffset)
//            .foregroundColor(.green)
//            .gesture(
//                DragGesture()
//                    .updating($dragOffset, body: { (value, state, transaction) in
//                        state = value.translation
//                    })
//                    .onEnded({ value in
//                        self.position.width += value.translation.width
//                        self.position.height += value.translation.height
//                    })
//            )
        
        // Combine gestures
        
//        Image(systemName: "star.circle.fill")
//            .font(.system(size: 100))
//            .opacity(dragState.isPressing ? 0.5 : 1.0)
//            .offset(x: position.width + dragState.translation.width, y: position.height + dragState.translation.height)
//            .animation(.easeInOut, value: dragState.translation)
//            .foregroundColor(.green)
//            .gesture(
//                LongPressGesture(minimumDuration: 1.0)
//                    .sequenced(before: DragGesture())
//                    .updating($dragState, body: { (value, state, transaction) in
//                        
//                        switch value {
//                        case .first(true):
//                            state = .pressing
//                        case .second(true, let drag):
//                            state = .dragging(translation: drag?.translation ?? .zero)
//                        default:
//                            break
//                        }
//
//                    })
//                    .onEnded({ (value) in
//
//                        guard case .second(true, let drag?) = value else {
//                            return
//                        }
//
//                        self.position.height += drag.translation.height
//                        self.position.width += drag.translation.width
//                    })
//            )
        DraggableView {
            Text("Swift")
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .bold()
                .foregroundColor(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
