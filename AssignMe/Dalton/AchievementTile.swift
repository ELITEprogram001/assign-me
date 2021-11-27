//
//  AchievementTile.swift
//  AssignMe
//
//  Created by Ridgeway, Dalton D on 11/25/21.
//

import SwiftUI

struct AchievementTile: View {
    
    let color: Color
    let title: String
    let image: String
    let desc: String
    @Binding var showModal: Bool
    
    init (title: String, image: String, desc: String, color: Color, showModal: Binding<Bool>) {
        self.title = title
        self.image = image
        self.desc = desc
        self.color = color
        _showModal = showModal
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            Spacer()
            Text(title)
                .font(.custom("Viga-Regular", size: 16, relativeTo: .title))
            Image(image)
                .resizable()
                .frame(width: 64, height: 64)
                .padding(.vertical, 10)
            Text("Level 0")
                .font(.custom("Ubuntu", size: 14, relativeTo: .body))
            Spacer()
        }
        .frame(minWidth: 40, maxWidth: .infinity)
        .background(Color.bg_light)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.bright_maroon, lineWidth: 2))
        .onTapGesture {
            showModal = true
            print("showModal please")
        }
    }
}
