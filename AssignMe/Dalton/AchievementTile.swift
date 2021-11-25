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
            Text("Level 0")
                .font(.custom("Ubuntu", size: 14, relativeTo: .body))
            Spacer()
            
            // DELETE: Old Tile Card
//            ZStack {
//                RoundedRectangle(cornerRadius: 8, style: .continuous)
//                    .fill(color)
//                    .frame(minWidth: 10, maxWidth: .infinity, minHeight: 40)
//                VStack(spacing: 0){
//                    HStack(spacing: 0) {
//                        Text(title)
//                            .font(.custom("Ubuntu-Bold", size: 18, relativeTo:.caption))
//                            .padding(.vertical, 3)
//                            .padding(.horizontal, 6)
//                        Spacer()
//                    }
//                    Spacer()
//                    Text(desc)
//                        .font(.custom("Ubuntu-Regular", size: 12, relativeTo:.body))
//                        .padding(.vertical, 8)
//                }
//            }
            
        }
        .frame(minWidth: 40, maxWidth: .infinity)
        .aspectRatio(1.5, contentMode: .fill)
        .background(Color.pink)
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
