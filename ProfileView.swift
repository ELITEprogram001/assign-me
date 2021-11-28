//
//  ProfileView.swift
//  AssignMe
//
//  Created by Ridgeway, Dalton D on 11/21/21.
//

import SwiftUI

struct ProfileView: View {
    
    let columns = [
        GridItem(.flexible(), spacing: 40, alignment: .center),
        GridItem(.flexible(), alignment: .center)
    ]
    
    @State var showModal: Bool = false
    @EnvironmentObject var user: User
    @State var selectedAchievement: Achievement
    
    init() {
        _selectedAchievement = State(initialValue: Achievement(name: "", desc: "", image: "", progress: 0))
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                
                ZStack {
                    VStack(spacing: 0) {
                        // Banner Section
                        HStack() {
                            Rectangle()
                                .fill(Color.fg_main)
                                /* Uncomment if a gradient is desired
                                .overlay(Rectangle()
                                            .fill(
                                                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.9), Color.black.opacity(0.1)]), startPoint: .bottom, endPoint: .top)
                                            )
                                        )
                                */
                                .ignoresSafeArea()
                        }
                        .frame(minHeight: 40, idealHeight: 50, maxHeight: 70)
                        .background(Color.yellow)
                        // end HStack
             
                        Divider()
                            .frame(height: 3)
                            .background(Color.white)
                        
                        // MARK: Tab View
                        TabView {
                            TaskBreakdownView()
                            TaskSummaryView()
                            QuoteView(quote: "You simply have to put one foot in front of the other and keep going. Put blinders on and plow right ahead.", author: "George Lucas")
                        }
                        .tabViewStyle(PageTabViewStyle())
                        .indexViewStyle(PageIndexViewStyle())
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        // end TabView
                        
                        //Spacer() Leaving this as a learning reminder. Spacers have a minimum distance and sometimes act like padding
                    }
                    VStack(spacing: 0) {
                        HStack() {
                            Spacer()
                            Image("cuttlefish_eye")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .mask(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 3))
                                .offset(x: 0, y: 80/8)
                            Spacer()
                        }
                        Spacer()
                    }
                }
                .frame(minHeight: 20, maxHeight: 400)
                // end ZStack
                
                Divider()
                    .frame(height: 3)
                    .background(Color.white)
                
                // MARK: Achievement View
                ScrollView(.vertical) {
                    HStack {
                        Text("Achievements")
                        Spacer()
                    }
                    .font(.custom("Viga-Regular", size: 20, relativeTo: .title))
                    .foregroundColor(Color.white)
                    .padding(.horizontal)
                    .padding(.top, 8)
                    // end HStack
                    
                    LazyVGrid (columns: columns, spacing: 15) {
                        ForEach(user.achievements) { achievement in
                            AchievementTile(achievement: achievement)
                                .onTapGesture {
                                    showModal = true
                                    selectedAchievement = achievement
                                }
                        }
                    }
                    .padding(.horizontal)
                }
                .background(Color.near_black.ignoresSafeArea())
                
            }
            // end VStack
            
            ModalView(showModal: $showModal, achievement: $selectedAchievement)
            
        } // end ZStack
        
        
    } // end body
}



struct QuoteView: View {
    
    let quote: String
    let author: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack (spacing: 0) {
                Spacer()
                /* I don't know how I feel about the image
                Image(systemName: "quote.bubble")
                    .resizable()
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .frame(width: 35, height: 35, alignment: .leading)
                    .padding(.horizontal)
                    .foregroundColor(Color.white)
                 */
                Text("Keep it up!")
                Spacer()
            }
            .padding(.top, 32)
            .padding(.bottom, 16)
            
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
                    .padding(.bottom, 30)
            }
            
            Spacer()
        }
        .background(Color.near_black)
    }
    
    init(quote: String, author: String) {
        self.quote = quote
        self.author = author
    }
}
