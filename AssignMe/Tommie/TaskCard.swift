//
//  TaskCard.swift
//  AssignMe
//
//  Created by Arceneaux, Tommie on 11/3/21.
//

import SwiftUI

struct TaskCard: View {
    var task: Task
        
        let formatter = DateFormatter()
        //let date = TaskTest.dueDate
        init(task:Task) {
            self.task = task
            formatter.dateFormat = "h:mm a, E MMM d"
        }
        
        var body: some View {
            
                        ZStack{ //Stacks all text, buttons, and other details; starting from bottom to top
                            Rectangle() //Card Body
                                .fill(Color (red: 0.35, green: 0.35, blue: 0.35))
                                .frame(width: 325, height: 87)
                                .shadow(radius: 6) //optional
                            
                            Text("\(task.name)") //Task name
                                .font(.system(size: 15.45, design: .serif))
                                .fontWeight(.medium)
                                .foregroundColor(Color.white)
                                //.multilineTextAlignment(.leading)
                                .frame (width: 200, alignment: .leading)
                                .lineLimit(1)
                                .padding(.leading, -93.0)
                                .padding (.bottom, 60)
                            
                            Text("\(formatter.string(from:task.dueDate)) - ") //Task's due date
                                .font(.system(size: 13, weight: .light, design: .serif))
                                .fontWeight(.bold)
                                .foregroundColor(task.category.color) //Color of due date text that corresponds to assigned category's color
                                .frame(minWidth: 0, idealWidth: 100, maxWidth: 200, minHeight: 1, idealHeight: 1, maxHeight: 1, alignment: .init(horizontal: .leading, vertical: .center))
                                .padding(.leading, -90.0)
                                .padding(.top, -5)
                            
                            Text("\(task.category.name)") //Name of category assigned to task
                                .font(.system(size: 11, weight: .light, design: .serif))
                                .fontWeight(.bold)
                                .foregroundColor(task.category.color) //Color of category name text that corresponds to assigned category's color
                                .frame(minWidth: 0, idealWidth: 100, maxWidth: 200, minHeight: 1, idealHeight: 1, maxHeight: 1, alignment: .init(horizontal: .leading, vertical: .center))
                                .padding(.leading, 193.0)
                                .padding(.top, -5)
                                
                            Text("\(task.description)") //Task description
                                .font(.system(size: 13, weight: .light, design: .serif))
                                //.fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .frame(minWidth: 0, idealWidth: 100, maxWidth: 300, minHeight: 1, idealHeight: 1, maxHeight: 1, alignment: .init(horizontal: .leading, vertical: .center))
                                .padding(.leading, 10.0)
                                .padding(.top, 40)

                            
                            
                            HStack{ //attributes for the category colour tab to the left
                                Rectangle() //Left-hand category colour tab
                                    .foregroundColor(task.category.color)
                                    .padding(.leading, 0.0)
                                    .frame(width: 15.0, height: 87)
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
                                .padding(.top, -40)
                                
                            } //VStack END
                            .frame(width: 305, height: 100, alignment: .trailing)
                                
                        
                        Button( //Button leading to Task Details (will need to path to Task Details for particular task)
                            action: {print("go to Task Details")},
                            label: {Rectangle()
                                .frame(width: 325, height: 100)
                                .foregroundColor(.clear)
                            }
                        ) // Button leading to Task Details END
                                
                            
                    } //ZStack END
        } // var body: some View END
    } // struct TaskCard: View END
    /*
    struct TaskCard_Previews: PreviewProvider {
        static var previews: some View {
            TaskCard()
        }
    }
    */