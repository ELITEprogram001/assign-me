//
//  TaskCard.swift
//  AssignMe
//
//  Created by Arceneaux, Tommie on 11/3/21.
//

import SwiftUI

struct TaskCard: View {
    let task: TaskEntity
    let formatter = DateFormatter()
    
    init(task: TaskEntity) {
        self.task = task
        formatter.dateFormat = "h:mm a, E MMM d"
    }
        
    var body: some View {
        
        ZStack{ //Stacks all text, buttons, and other details; starting from bottom to topPP
            
            //Card Body
            Rectangle()
                .fill(Color (red: 0.25, green: 0.25, blue: 0.25))
                .frame(width: 325, height: 70)
                .shadow(radius: 6) //optional
                .cornerRadius(10)
            
            //Task name
            Text("\(task.wrappedName)")
                .fontWeight(.bold)
                .font(.custom("Ubuntu-Regular", size: 20))
                .foregroundColor(Color.white)
                .frame (width: 200, alignment: .leading)
                .lineLimit(1)
                .padding(.leading, -93.0)
                .padding (.bottom, 40)
            
            //Task's due date
            Text("\(formatter.string(from:task.dueDate ?? Date()))  -")
                .font(.custom("Ubuntu-Regular", size: 14))
                .fontWeight(.bold)
                .foregroundColor(Color(task.category?.color ?? "gray"))
                .frame(minWidth: 0, idealWidth: 100, maxWidth: 200, minHeight: 1, idealHeight: 1, maxHeight: 1, alignment: .init(horizontal: .leading, vertical: .center))
                .padding(.leading, -95.0)
            
            //Name of category assigned to task
            Text(task.category?.wrappedName ?? "")
                .fontWeight(.bold)
                .font(.custom("Ubuntu-Regular", size: 13))
                .foregroundColor(Color(task.category?.color ?? "gray"))
                .frame(minWidth: 0, idealWidth: 100, maxWidth: 150, minHeight: 1, idealHeight: 1, maxHeight: 1, alignment: .init(horizontal: .leading, vertical: .center))
                .padding(.leading, 180.0)
            
            //Task description
            Text("\(task.wrappedDesc)")
                .font(.custom("Ubuntu-Regular", size: 13))
                .foregroundColor(Color.white)
                .frame(minWidth: 0, idealWidth: 100, maxWidth: 300, minHeight: 1, idealHeight: 1, maxHeight: 1, alignment: .init(horizontal: .leading, vertical: .center))
                .padding(.leading, 10.0)
                .padding(.top, 40)
            
            
            
            HStack{ //attributes for the category colour tab to the left
                Rectangle() //Left-hand category colour tab
                    .foregroundColor(Color(task.category?.color ?? "gray"))
                    .padding(.leading, 0.0)
                    .frame(width: 15.0, height: 70)
                    .cornerRadius(4)
            } //attributes for the category colour tab END
            .padding(.leading, -165.0) //padding for category colour tab
            
            
            VStack{ //anchors difficulty stars to top of card
                HStack{ //anchors difficulty stars to right of card
                    let starCount = task.difficulty
                    ForEach (1...starCount, id:\.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                            .frame(width: 13)
                    } //ForEach loop to populate difficulty stars END
                } //HStack END
                .padding(.top, -30)
                
            } //VStack END
            .frame(width: 305, height: 75, alignment: .trailing)
            
        } //ZStack END
    } // var body: some View END
} // struct TaskCard: View END
