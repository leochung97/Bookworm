//
//  TextEditorNotes.swift
//  Bookworm
//
//  Created by Leo Chung on 1/9/24.
//

import SwiftUI

/*
 TextField is great if a user wants to enter a short piece of text
 TextEditor is better for longer pieces of text as it also expects to be given a two-way binding to a text string, but has the additional benefit of allowing multiple lines of text
 TextEditor cannot be adjusted for its style or adding placeholder text - you just bind it to a string
 You need to make sure it doesn't go outside the safe area, otherwise typing will be tricky; you can avoid this by embedding it into a NavigationStack or a Form, or similar wrapper
*/

/*
 There is also a third option instead of TextField and TextEditor - you can create a TextField with an optional axis it can grow along; this means the textfield starts out as a regular, single-line text field but can grow just like an iMessage text box
*/

struct TextEditorNotes: View {
    // Note: @AppStorage is not designed to store secure information, so never use it for anything private
    // Note: SwiftUI may also change how things look once they are inside of a Form wrapper instead of a Stack
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack {
            TextField("Enter your text", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Notes")
                .padding()
            // TextEditor(text: $notes)
            //     .navigationTitle("Notes")
            //     .padding()
        }
    }
}

#Preview {
    TextEditorNotes()
}
