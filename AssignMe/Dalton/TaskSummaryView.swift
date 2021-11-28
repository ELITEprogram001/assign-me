//
//  TaskSummaryView.swift
//  AssignMe
//
//  Created by Ridgeway, Dalton D on 11/28/21.
//

import SwiftUI

struct TaskSummaryView: View {
    
    @EnvironmentObject var user: User
    var completionByDifficulty: [Int] { getCompletionByDifficulty() }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            // MARK: Difficulty Section
            VStack(spacing: 0){
                // Section title
                HStack(spacing: 0) {
                    Text("Completed by Difficulty:")
                        .font(.custom("Viga", size: 16, relativeTo:.title))
                        .padding(.top, 5)
                        .padding(.bottom, 8)
                    Spacer()
                } // end section title
                
                // Task completion per difficulty
                HStack(spacing: 25) {
                    
                    Spacer()
                    
                    VStack(spacing: 0) {
                        Text(completionByDifficulty[5].description)
                            .font(.custom("Ubuntu-Bold", size: 24, relativeTo:.body))
                        Text("5-Star")
                            .foregroundColor(.yellow)
                    }
                    
                    VStack(spacing: 0) {
                        Text(completionByDifficulty[4].description)
                            .font(.custom("Ubuntu-Bold", size: 24, relativeTo:.body))
                        Text("4-Star")
                            .foregroundColor(.yellow)
                    }
                    
                    VStack(spacing: 0) {
                        Text(completionByDifficulty[3].description)
                            .font(.custom("Ubuntu-Bold", size: 24, relativeTo:.body))
                        Text("3-Star")
                            .foregroundColor(.yellow)
                    }
                    
                    VStack(spacing: 0) {
                        Text(completionByDifficulty[2].description)
                            .font(.custom("Ubuntu-Bold", size: 24, relativeTo:.body))
                        Text("2-Star")
                            .foregroundColor(.yellow)
                    }
                    
                    VStack(spacing: 0) {
                        Text(completionByDifficulty[1].description)
                            .font(.custom("Ubuntu-Bold", size: 24, relativeTo:.body))
                        Text("1-Star")
                            .foregroundColor(.yellow)
                    }
                    
                    Spacer()
                    
                }
                .font(.custom("Ubuntu-Light", size: 14, relativeTo:.body))
                // end task completion per difficulty count
            }
            // end difficulty section
            
            
            // MARK: Hardest Task
            VStack(spacing: 0) {
                // View title
                HStack(spacing: 0) {
                    Text("Previously Completed:")
                        .font(.custom("Viga", size: 16, relativeTo:.title))
                        .padding(.vertical)
                    Spacer()
                } // end view title
                
                HStack(spacing: 0) {
                    Spacer()
                    
                    if(!user.completedList.isEmpty) {
                        TaskCard(task: user.completedList.last!)
                    } else {
                        Text("Go complete some tasks!")
                            .font(.custom("Ubuntu-Regular", size: 14, relativeTo:.body))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
            }
            
            Spacer()
            
        }
        .padding()
        .background(Color.bg_dark.ignoresSafeArea())
        // end outmost vstack
        
    } // end body
    
    //MARK: Custom Functions
    
    func getCompletionByDifficulty() -> [Int] {
        var completionByDifficulty: [Int] = [0,0,0,0,0,0]
        
        for task in user.completedList {
            completionByDifficulty[task.difficulty] += 1
        }
        
        return completionByDifficulty
    }
    
} // end TaskSummaryView struct
