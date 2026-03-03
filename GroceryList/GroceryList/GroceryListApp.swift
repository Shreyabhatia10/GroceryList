//
//  GroceryListApp.swift
//  GroceryList
//
//  Created by Shreya on 02/03/26.
//

import SwiftUI
import SwiftData

@main
struct GroceryListApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            GroceryItem.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            GroceryListHomeView()
        }
        .modelContainer(sharedModelContainer)
    }
}
