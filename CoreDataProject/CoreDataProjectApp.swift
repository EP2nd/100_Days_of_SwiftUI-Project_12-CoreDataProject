//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Edwin Przeźwiecki Jr. on 29/01/2023.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
