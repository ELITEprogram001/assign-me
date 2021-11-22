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
 
            // Statistics Section
            TabView {
                Text("TODO Graph")
                Text("TODO Medal Stats")
                QuoteView(quote: "You simply have to put one foot in front of the other and keep going. Put blinders on and plow right ahead.", author: "George Lucas")
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle())
            .background(Color.red)
            .font(.custom("Viga-Regular", size: 20, relativeTo: .title))
            .foregroundColor(Color.white)
            .frame(minWidth: 0, idealWidth: .infinity)
            
            
            // Achievement Section
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
                    Spacer()
                    Text(desc)
                        .font(.custom("Ubuntu-Regular", size: 12, relativeTo:.body))
                        .padding(.vertical, 8)
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

struct QuoteView: View {
    
    let quote: String
    let author: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack (spacing: 0) {
                Spacer()
                Image(systemName: "quote.bubble")
                    .resizable()
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .frame(width: 35, height: 35, alignment: .leading)
                    .padding()
                    .foregroundColor(Color.white)
                Text("A Quote For Consideration")
                    .padding(.vertical, 16)
                Spacer()
            }
            .padding(.top, 15)
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Spacer()
                    Text(quote)
                        .font(.custom("Ubuntu-Italic", size: 16, relativeTo:.body))
                    Spacer()
                }
                .padding(.horizontal, 40)
                Text("- " + author)
                    .font(.custom("Ubuntu-LightItalic", size: 12, relativeTo:.footnote))
                    .offset(x: 60, y: 0)
                    .padding(.top, 20)
            }
            .padding(.top, 30)
            Spacer()
        }
        .background(Color.near_black)
    }
    
    init(quote: String, author: String) {
        self.quote = quote
        self.author = author
    }
}
