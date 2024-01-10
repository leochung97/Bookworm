//
//  RatingView.swift
//  Bookworm
//
//  Created by Leo Chung on 1/10/24.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
            }
        }
        .buttonStyle(.plain)
        // buttonStyle(.plain) will make SwiftUI treat every button individually rather than as a group -> there's no need to tap into a detail view with a picker here because star ratings are more natural and common
    }
}

// Constant bindings are binsings that have fixed values, which means they can't be changed in the UI but are perfect for previews
#Preview {
    RatingView(rating: .constant(4))
}
