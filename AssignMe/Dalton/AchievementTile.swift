//
//  AchievementTile.swift
//  AssignMe
//
//  Created by Ridgeway, Dalton D on 11/25/21.
//

import SwiftUI

struct AchievementTile: View {
    
    let title: String
    let image: String
    let achievement: Achievement
    
    var body: some View {
        VStack(spacing: 0) {
            
            Spacer()
            Text(title)
                .font(.custom("Ubuntu-Regular", size: 14, relativeTo: .title))
            Image(image)
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.vertical, 5)
//            Text("Level 0")
//                .font(.custom("Ubuntu", size: 10, relativeTo: .body))
            Spacer()
            
        }
        .frame(minWidth: 40, maxWidth: .infinity)
        .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.fg_main, lineWidth: 1))
    }
    
    init(achievement: Achievement) {
        self.achievement = achievement
        self.title = achievement.name
        self.image = achievement.image
    }
}

//struct AchievementTile_Previews: PreviewProvider {
//    static var previews: some View {
//        AchievementTile()
//    }
//}
