//
//  TaskGraphView.swift
//  AssignMe
//
//  Created by Ridgeway, Dalton D on 11/28/21.
//

import SwiftUI
import SwiftUICharts

struct TaskBreakdownView: View {
    
    @EnvironmentObject var user: User
    let cal: Calendar = Calendar.current
    var completedTaskBreakdown: [Int] { getUserStats() }
    
    var body: some View {
        VStack(spacing: 15) {
            
            // section title
//            HStack(spacing: 0) {
//                Text("Lifetime Task Breakdown")
//                    .font(.custom("Viga", size: 16, relativeTo: .title))
//                Spacer()
//            }
//            .padding(.top, 10)
            // end section title
            
            Spacer()
            
            // completed early stat section
            HStack(spacing: 0) {
                Spacer()
                Text(completedTaskBreakdown[0].description)
                    .font(.custom("Viga", size: 24, relativeTo: .title))
                    .foregroundColor(.blue)
                    .padding(.horizontal)
                if(completedTaskBreakdown[0] != 1) {
                    Text("tasks completed early")
                        .font(.custom("Ubuntu-Regular", size: 16, relativeTo: .body))
                } else {
                    Text("task completed early")
                        .font(.custom("Ubuntu-Regular", size: 16, relativeTo: .body))
                }
                Spacer()
            }
            // end completed early stat section
            
            
            // completed on time stat section
            HStack(spacing: 0) {
                Spacer()
                Text(completedTaskBreakdown[1].description)
                    .font(.custom("Viga", size: 24, relativeTo: .title))
                    .foregroundColor(.green)
                    .padding(.horizontal)
                if(completedTaskBreakdown[1] != 1) {
                    Text("tasks completed on time")
                        .font(.custom("Ubuntu-Regular", size: 16, relativeTo: .body))
                } else {
                    Text("task completed on time")
                        .font(.custom("Ubuntu-Regular", size: 16, relativeTo: .body))
                }
                Spacer()
            }
            // end completed on time stat section
            
            // completed on time stat section
            HStack(spacing: 0) {
                Spacer()
                Text(completedTaskBreakdown[2].description)
                    .font(.custom("Viga", size: 24, relativeTo: .title))
                    .foregroundColor(.red)
                    .padding(.horizontal)
                if(completedTaskBreakdown[2] != 1)  {
                    Text("overdue tasks")
                        .font(.custom("Ubuntu-Regular", size: 16, relativeTo: .body))
                } else {
                    Text("overdue task")
                        .font(.custom("Ubuntu-Regular", size: 16, relativeTo: .body))
                }
                
                Spacer()
            }
            .padding(.bottom, 20)
            // end completed on time stat section
            
            Spacer()
            
        }
        .padding() // end outter vstack
    }
    
    func getUserStats() -> [Int] {
        // index 0: completed 2+ days ahead of schedule
        // index 1: completed
        // index 2: overdue
        var data: [Int] = [0, 0, 0]
        
        for task in user.completedList {
            
            if(task.isOverdue()) {
                data[2] += 1
                continue
            }
            
            let ddComp = cal.dateComponents([.year, .month, .day], from: task.dueDate)
            let cComp = cal.dateComponents([.year, .month, .day], from: task.dateCompleted!)
            
            if(ddComp.year == cComp.year && ddComp.month == cComp.month) {
                if(ddComp.day! >= (cComp.day! + 2)) {
                    data[0] += 1
                } else {
                    data[1] += 1
                }
            }
        }
        
        return data
    } // end getUserStats
}
