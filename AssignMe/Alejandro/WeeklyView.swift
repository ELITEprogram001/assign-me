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
    
    @FetchRequest(
        entity: CategoryEntity.entity(),
        sortDescriptors: [],
        predicate: NSPredicate(format: "name = 'Uncategorized'")
    ) var categories: FetchedResults<CategoryEntity>
    
    init(tabSelection: Int){
        _tabSelection = State(initialValue: tabSelection)
        
        var nowComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date())
        nowComponents.hour = 0;
        nowComponents.minute = 0;
        nowComponents.second = 1;
        let now = Calendar.current.date(from: nowComponents)
        let later = Calendar.current.date(byAdding: .day, value: 7, to: now ?? Date())
        
        tasksRequest = FetchRequest(
            entity: TaskEntity.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \TaskEntity.dueDate, ascending: true)],
            predicate: NSPredicate(format: "dueDate > %@ AND dueDate < %@", (now ?? Date()) as NSDate, later! as NSDate)
        )
        
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Your Next Week")
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
        .onAppear() {
            // If the uncategorized category doesn't exist
            if(categories.isEmpty) {
                let uncategorized = CategoryEntity(context: managedObjectContext)
                uncategorized.name = "Uncategorized"
                uncategorized.color = "gray"
                
                try? managedObjectContext.save()
            }
        }
        // end vstack
        
    }//body
    
}

