//
//  BindingNotes.swift
//  Bookworm
//
//  Created by Leo Chung on 1/9/24.
//

import SwiftUI

/*
@State property wrapper lets you work with local value types
@Bindable lets you make bindings to properties inside observable classes
@Binding lets you share a simple @State property of one view with another, so that they both point to the same integer, string, Boolean, and so on
@Binding lets you store a single mutable value in a view that actually points to some other value from elsewhere
In the case of Toggle, the switch changes its own local binding to a Boolean, but behind the scenes, that's actually manipulating the @State property in our view - they are both reading and writing the same boolean
@Bindable is used when you're accessing a shared class that uses the @Observable macro - you create it using @State in one view and then you use @Bindable when sharing it with other views so SwiftUI can create bindings there too
@Bindable is used when you have a simple, value type piece of data rather than a separate class; for example, if you have a @State property that stores a Boolean, a Double, an array of strings, etc. and you want to pass it around - you don't use the @Observable macro (so you can't use @Bindable) - instead, you would use @Binding so we can share that Boolean or integer in several places
 @Binding is extremely important for whenever you want to create a custom user interface component - at their core, UI componnets are just SwiftUI views but @Binding is what sets them apart
*/

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool

    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]

    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct BindingNotes: View {
    @State private var rememberMe = false

    var body: some View {
        VStack {
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

#Preview {
    BindingNotes()
}
