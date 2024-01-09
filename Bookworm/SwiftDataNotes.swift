//
//  SwiftDataNotes.swift
//  Bookworm
//
//  Created by Leo Chung on 1/9/24.
//

import SwiftUI

/*
 SwiftData is a powerful, modern framework for storing, querying, and filtering data
 SwiftData is an object graph and persistence framework, which is a fancy way of saying it lets us define objects and properties of those objects, then lets us read and write them from permanent storage
 SwiftData is capable of sorting and filtering data, and can work with much larger data (effectively no limit to how much data it can store)
 SwiftData implements all sorts of more advanced functionalities for when you really need to lean on it including: iCloud syncing, lazy loading of data, undo and redo, and much more
*/

import SwiftData

// Instead of @Observable, we want to use @Model to allow SwiftData to load and save students - we can now query, delete, and link them to other objects
// This class is called a SwiftData model: it defines some kind of data we want to work with in our apps
// @Model builds on top of the same observation system that @Observable uses, which means it works really well with SwiftUI

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}

struct SwiftDataNotes: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SwiftDataNotes()
}
