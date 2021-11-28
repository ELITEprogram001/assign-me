//
//  Achievement.swift
//  AssignMe
//
//  Created by Ridgeway, Dalton D on 11/28/21.
//

import SwiftUI

class Achievement: Identifiable {
    let id = UUID()
    let name: String
    let desc: String
    let image: String
    let progress: CGFloat
    
    init(name: String, desc: String, image: String, progress: CGFloat) {
        self.name = name
        self.desc = desc
        self.image = image
        self.progress = progress
    }
}
