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
    @FetchRequest(
      entity: TaskEntity.entity(),
      sortDescriptors: [NSSortDescriptor(keyPath: \TaskEntity.dueDate, ascending: true)]
    ) var tasks: FetchedResults<TaskEntity>
    
    
    var body: some View {
        NavigationView {
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
            .navigationBarTitle("")
            .navigationBarHidden(true)
            // end vstack
                
            
        } // end navigation view
        
        
        
        
    }//body
    
}

