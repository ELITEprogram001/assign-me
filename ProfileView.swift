//
//  ProfileView.swift
//  AssignMe
//
//  Created by Ridgeway, Dalton D on 11/21/21.
//

import SwiftUI

struct ProfileView: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            
            // Banner Section
            HStack() {
                Spacer()
                Image("cuttlefish_eye")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .mask(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
                    .offset(x: 0, y: 100/4)
                Spacer()
            }
            .background(
                Image("underwater_banner")
                    .resizable()
                    .ignoresSafeArea()
            )
            // end HStack
            
            /* TODO: Need to figure out how to put divider under picture
            Divider()
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 3)
                .padding(.vertical, 0)
                .background(Color.white)
            */
 
            // Last Week Section
            VStack (spacing: 0) {
                HStack (spacing: 0) {
                    Text("Your Last Week")
                        .padding(.vertical, 16)
                        .padding(.horizontal)
                    Spacer()
                }
                TabView {
                    Text("First")
                    Text("Second")
                    Text("Third")
                    Text("Fourth")
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle())
            }
            .font(.custom("Viga-Regular", size: 20, relativeTo: .title))
            .foregroundColor(Color.white)
            
            ScrollView(.vertical) {
                HStack {
                    Text("Achievements")
                    Spacer()
                }
                .font(.custom("Viga-Regular", size: 20, relativeTo: .title))
                .foregroundColor(Color.white)
                .padding(.horizontal)
                // end HStack
                
                LazyVGrid (columns: columns, spacing: 15) {
                    AchievementCards(title: "Redemption", desc: "Complete 3 tasks that were overdue.", color: .red)
                    AchievementCards(title: "Overachiever", desc: "Complete 5 tasks that aren't due for another week.", color: .green)
                    AchievementCards(title: "A Marathon Starts With a Step", desc: "Complete your first task!", color: .blue)
                    AchievementCards(title: "Dedicated", desc: "Complete 4 tasks for one category back to back.", color: .orange)
                    AchievementCards(title: "Busy Bee", desc: "Have 15 tasks scheduled.", color: .yellow)
                    AchievementCards(title: "Consistent Worker", desc: "Complete all your tasks on time for 5 days in a row.", color: .red)
                    AchievementCards(title: "The Planner", desc: "Plan your first 3 tasks.", color: .orange)
                    AchievementCards(title: "Take a break", desc: "Complete 3 tasks in 1 hour.", color: .green)
                }
                .padding(.horizontal)
            }
            .padding(.top, 10)
            .background(Color.bg_dark.ignoresSafeArea())
            
            Spacer()
        }
        .background(Color.bg_light.ignoresSafeArea())
        // end VStack
    }
}

// Achievement Card Views
struct AchievementCards: View {
    
    let color: Color
    let title: String
    let desc: String
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
                    .frame(minWidth: 10, maxWidth: .infinity, minHeight: 40)
                VStack(spacing: 0){
                    HStack(spacing: 0) {
                        Text(title)
                            .font(.custom("Ubuntu-Bold", size: 18, relativeTo:.caption))
                            .padding(.vertical, 3)
                            .padding(.horizontal, 6)
                        Spacer()
                    }
                    Text(desc)
                        .font(.custom("Ubuntu-Regular", size: 12, relativeTo:.body))
                        .padding(.vertical, 5)
                }
            }
        }
    }
    
    init(title: String, desc: String, color: Color) {
        self.title = title
        self.desc = desc
        self.color = color
    }
}
