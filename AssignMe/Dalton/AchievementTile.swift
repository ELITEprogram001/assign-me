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
    let desc: String
    
    var body: some View {
        VStack(spacing: 0) {
            
            Spacer()
            Text("Example Achievement")
                .font(.custom("Viga-Regular", size: 16, relativeTo: .title))
            Image("book")
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
        //.aspectRatio(1.5, contentMode: .fill)
    }
    
    init(title: String, desc: String, color: Color) {
        self.title = title
        self.desc = desc
        self.color = color
    }
}

//struct AchievementTile_Previews: PreviewProvider {
//    static var previews: some View {
//        AchievementTile()
//    }
//}
