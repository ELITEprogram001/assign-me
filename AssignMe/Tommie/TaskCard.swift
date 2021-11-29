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
            //add some change
            ZStack{ //Stacks all text, buttons, and other details; starting from bottom to topPP
                Rectangle() //Card Body
                    .fill(Color (red: 0.25, green: 0.25, blue: 0.25))
                    .frame(width: 325, height: 70)
                    .shadow(radius: 6) //optional
                    .cornerRadius(10)
                
                Text("\(task.name)") //Task name
                    .fontWeight(.bold)
                    .font(.custom("Montserrat-Regular", size: 20))
                    //.font(.system(size: 20, design: .serif))
                    .foregroundColor(Color.white)
                    //.multilineTextAlignment(.leading)
                    .frame (width: 200, alignment: .leading)
                    .lineLimit(1)
                    .padding(.leading, -93.0)
                    .padding (.bottom, 40)
                
                HStack () { //alignment for the dueDate and Category name on the task card
                    
                    Text("\(formatter.string(from:task.dueDate))  -") //Task's due date
                        //.font(.system(size: 13, weight: .light, design: .serif))
                        .font(.custom("Ubuntu-Regular", size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(task.category.color) //Color of due date text that corresponds to assigned category's color
                    
                    HStack () {
                        Text("\(task.category.name)") //Name of category assigned to task
                            //.font(.system(size: 11, weight: .light, design: .serif))
                            .fontWeight(.bold)
                            .font(.custom("Montserrat-Regular", size: 13))
                            .foregroundColor(task.category.color) //Color of category name text that corresponds to assigned category's color
                            .frame(width: 143, height: 1, alignment: .leading)
                    } //HStack end
                    
                } //HStack end
                .padding(.leading, 37)
                .frame(width: 370, height: 1, alignment: .leading)
                
                Text("\(task.description)") //Task description
                    .font(.custom("Ubuntu-Regular", size: 13))
                    //.font(.system(size: 13, weight: .light, design: .serif))
                    //.fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: 300, minHeight: 1, idealHeight: 1, maxHeight: 1, alignment: .init(horizontal: .leading, vertical: .center))
                    .padding(.leading, 10.0)
                    .padding(.top, 40)
                HStack{ //attributes for the category colour tab to the left
                    Rectangle() //Left-hand category colour tab
                        .foregroundColor(task.category.color)
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
    /*
    struct TaskCard_Previews: PreviewProvider {
        static var previews: some View {
            TaskCard()
        }
    }
    */
