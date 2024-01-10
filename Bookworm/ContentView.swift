//
//  ContentView.swift
//  Bookworm
//
//  Created by Leo Chung on 1/9/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    // SortDescriptor type -> you can input the property you want to sort on and optionally whether it should be reversed or not
    // You can also add multiple SortDescriptors to first sort by Title and then by Author
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author, order: .reverse)
    ]) var books: [Book]
    
    @State private var showingAddScreen = false
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our query
            let book = books[offset]

            // delete it from the context
            modelContext.delete(book)
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                // Note: SwiftUI doesn't require an identifier for the ForEach because all SwiftData models conform to Identifiable automatically
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)

                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
           .navigationTitle("Bookworm")
           .navigationDestination(for: Book.self) { book in
               DetailView(book: book)
           }
           .toolbar {
               ToolbarItem(placement: .topBarTrailing) {
                   Button("Add Book", systemImage: "plus") {
                       showingAddScreen.toggle()
                   }
               }
               ToolbarItem(placement: .topBarLeading) {
                   EditButton()
               }
           }
           .sheet(isPresented: $showingAddScreen) {
               AddBookView()
           }
       }
    }
}

#Preview {
    ContentView()
}
