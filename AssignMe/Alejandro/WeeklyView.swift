//
//  SwiftUIView.swift
//  AssignMe
//
//  Created by Santos, Alejandro on 11/3/21.
//

import SwiftUI


//var task: [Task] = TaskList.taskArray


struct WeeklyView: View {
    
    @State var tabSelection: Int
    @Environment(\.managedObjectContext) var managedObjectContext
    var tasksRequest: FetchRequest<TaskEntity>
    var tasks: FetchedResults<TaskEntity>{ tasksRequest.wrappedValue }
    
    init(tabSelection: Int){
        _tabSelection = State(initialValue: tabSelection)
        
        let now = Date()
        let later = Calendar.current.date(byAdding: .day, value: 7, to: now)
        
        tasksRequest = FetchRequest(
            entity: TaskEntity.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \TaskEntity.dueDate, ascending: true)],
            predicate: NSPredicate(format: "dueDate > %@ AND dueDate < %@", now as NSDate, later! as NSDate)
        )
        
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("PlaceHolder Date")
                    .font(.custom("Viga-Regular", size: 25))
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView {
                LazyVStack() {
                    ForEach(tasks) { task in
                        TaskCard(task: task)
                    }
                    .padding(.bottom, 10)
                }
            }
            .padding()
        }
        .background(Color.bg_dark.ignoresSafeArea())
        // end vstack
        
    }//body
    
}

//struct

