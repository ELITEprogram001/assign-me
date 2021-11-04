//
//  RatingView.swift
//  AssignMe
//
//  Created by Rohan Jose on 10/30/21.
//

import SwiftUI

struct DifficultyView: View {
    @Binding var rating: Int
    var label = ""
    var maximumRating = 4
    var offImage: Image?
    var onImage = Image(systemName:"star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack{
            if label.isEmpty == false{
                Text(label)
            }
            ForEach(1..<maximumRating + 1){ number in
                self.image(for: number)
                    .resizable()
                    .frame(width: 32.0, height: 32.0)
                    .foregroundColor(number > self.rating ? self.offColor : self.onColor)
                    .onTapGesture {
                        self.rating = number
                    }
                
            }
        }
    }
    func image(for number: Int) -> Image{
        if number > rating{
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}
