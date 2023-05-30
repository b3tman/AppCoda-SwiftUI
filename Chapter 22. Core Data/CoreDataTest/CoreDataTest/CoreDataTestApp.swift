//
//  CoreDataTestApp.swift
//  CoreDataTest
//
//  Created by Maxim Brishten on 30.05.23.
//

import SwiftUI

@main
struct CoreDataTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
