//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Leo Chung on 1/9/24.
//

import SwiftUI
import SwiftData

/*
 Tells Swift this is what launches our application - internally, this is what bootstraps the entire program when the user launches our application from the iOS Home Screen
 WindowGroup tells SwiftUI that our app can be displayed in many windows - it doesn't do much on iPhone, but on iPad and macOS it becomes a lot more important
 A model container is SwiftData's name for where it stores its data - the first time your app runs, SwiftData will create an underlying database file but in the future will load the database
 Model context, which is effectively the "live" version of your data - when you load objects and change them, those changes only exist in memory until they are SAVED
 The job of the model context is to let you work with all of our data in memory, which is faster than constantly reading and writing data to disk
 Model context is created automatically when you use the .modelContainer() modifier; SwiftData automatically creates one model context for us called the main context, and stores it in SwiftUI's environment
 Retrieving information from SwiftData is done using a query - we describe what we want, how it should be sorted, and whether any filters should be used, and SwiftData will send back all of the matching data
*/

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Student.self)
    }
}
