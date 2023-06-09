//
//  SwiftUIToDoListApp.swift
//  SwiftUIToDoList
//
//  Created by Maxim Brishten on 30.05.23.
//

import SwiftUI

@main
struct SwiftUIToDoListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
