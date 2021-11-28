//  TaskCard.swift
//  AssignMe
//
//  Created by Arceneaux, Tommie on 11/3/21.
//

import SwiftUI

struct TaskCard: View {
    let task: TaskEntity
    let formatter = DateFormatter()
    @State var showSheet: Bool = false
    
    init(task: TaskEntity) {
        self.task = task
        formatter.dateFormat = "h:mm a, E MMM d"
    }
    
    var body: some View {
        
        HStack(){
            
            // Color Strip
            Rectangle()
                .fill(Color(task.category?.wrappedColor ?? "gray"))
                .frame(width: 10)
            
            // MARK: Text Formatting
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("\(task.wrappedName)")
                        .font(.custom("Ubuntu-Regular", size: 20))
                        .foregroundColor(Color.white)
                        .lineLimit(1)
                    
                    Spacer()
                    ForEach(1...task.difficulty, id:\.self) { _ in
                        ZStack{
                            Image(systemName: "star.fill")
                                .resizable()
                                .foregroundColor(Color.yellow)
                                .frame(width: 20, height: 20)
                                .padding(.horizontal, 1)
                            Image(systemName: "star")
                                .resizable()
                                .foregroundColor(Color.bg_dark)
                                .frame(width: 20, height: 20)
                                .padding(.horizontal, 1)
                        }
                    }
                    
                }
                
                // Task's due date and category
                HStack {
                    Text("\(formatter.string(from:task.dueDate ?? Date())) - \(task.category?.wrappedName ?? "")")
                        .font(.custom("Ubuntu-Regular", size: 14))
                        .foregroundColor(Color(task.category?.color ?? "gray"))
                    
                    Spacer()
                }
                .padding(.vertical, 4)
                
                // Task description
                HStack {
                    Text("\(task.wrappedDesc)")
                        .font(.custom("Ubuntu-Regular", size: 13))
                        .foregroundColor(Color.white)
                    
                    Spacer()
                }
            }
            .padding(.horizontal, 5)
            .padding(.vertical, 8)
            
        }
        .frame(maxWidth: .infinity, maxHeight: 180)
        .background(Color.bg_light)
        .onTapGesture {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            TaskDetailsView(task: task, showSheet: $showSheet)
        }
        
    } // var body: some View END
} // struct TaskCard: View END
