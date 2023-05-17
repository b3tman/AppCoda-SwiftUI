//
//  SwiftUIFormRegistrationApp.swift
//  SwiftUIFormRegistration
//
//  Created by Maxim Brishten on 17.05.23.
//

import SwiftUI

@main
struct SwiftUIFormRegistrationApp: App {
    
    let viewModel = UserRegistrationViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
