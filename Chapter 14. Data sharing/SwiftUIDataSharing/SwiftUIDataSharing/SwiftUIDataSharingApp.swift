//
//  SwiftUIDataSharingApp.swift
//  SwiftUIDataSharing
//
//  Created by Maxim Brishten on 16.05.23.
//

import SwiftUI

@main
struct SwiftUIDataSharingApp: App {
    var settingsStore = SettingStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(settingsStore)
        }
    }
}
