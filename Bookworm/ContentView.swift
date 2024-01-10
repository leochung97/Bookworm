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
    @Query var books: [Book]
    
    @State private var showingAddScreen = false
    
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
