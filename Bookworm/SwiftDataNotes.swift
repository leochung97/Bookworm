//
//  SwiftDataNotes.swift
//  Bookworm
//
//  Created by Leo Chung on 1/9/24.
//

import SwiftUI
import SwiftData

/*
 SwiftData is a powerful, modern framework for storing, querying, and filtering data
 SwiftData is an object graph and persistence framework, which is a fancy way of saying it lets us define objects and properties of those objects, then lets us read and write them from permanent storage
 SwiftData is capable of sorting and filtering data, and can work with much larger data (effectively no limit to how much data it can store)
 SwiftData implements all sorts of more advanced functionalities for when you really need to lean on it including: iCloud syncing, lazy loading of data, undo and redo, and much more
*/

/*
 Instead of @Observable, we want to use @Model to allow SwiftData to load and save students - we can now query, delete, and link them to other objects
 This class is called a SwiftData model: it defines some kind of data we want to work with in our apps
 @Model builds on top of the same observation system that @Observable uses, which means it works really well with SwiftUI
*/

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
    // @Query will atuomatically load students from its model container - it finds the main context that was placed into the environment and queries the container through there
    @Query var students: [Student]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]

                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!

                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    SwiftDataNotes()
}
