//
//  ContentView.swift
//  AssignMe
//
//  Created by Ridgeway, Dalton D on 10/13/21.
//

import SwiftUI
struct ContentView: View {
    
//    // Test Category
    @State private var tabSelection = 1
    var Uncategorized = Category(name:"Uncategorized",color:Color.gray) //var for uncategorized category that's hidden from CategoriesListView
    
    let persistenceController = PersistenceController.shared
    var user: UserOld = UserOld(name: "User")
    
//    @FetchRequest(
//      entity: UserEntity.entity(),
//      sortDescriptors: []
//    ) var u: FetchedResults<UserEntity>
    
    init()
    {
        
        // TODO implement persistent data
        user.addCategory(cat:Uncategorized) //init for uncategorized category
        var sample = Task(name: "push ups", category: Uncategorized, description: "I will do 100 push ups!", difficulty: 5, dueDate: Date(), dateCompleted: Date(), isOverdue: true)
        var sample2 = Task(name: "push downs", category: Uncategorized, description: "I will do 100 push ups!", difficulty: 5, dueDate: Calendar.current.date(byAdding: .day, value: -7, to: Date()) ?? Date(), dateCompleted: Date(), isOverdue: true)
        var sample3 = Task(name: "push sides", category: Uncategorized, description: "I will do 100 push ups!", difficulty: 5, dueDate: Calendar.current.date(byAdding: .day, value: 14, to: Date()) ?? Date(), dateCompleted: Date(), isOverdue: true)
        user.taskList.append(sample)
        user.taskList.append(sample2)
        user.taskList.append(sample3)
        
//        for us in u {
//            if( us.wrappedName != "fuck" ) {
//                let use = UserEntity(context: persistenceController.container.viewContext)
//                use.name = "fuck"
//            }
//        }
        
    }

    var body: some View {
        TabView(selection:$tabSelection){
            WeeklyView(tabSelection: 1)
                .tabItem {
                    Text("Weekly View")
                    Image(systemName: "house.fill")
                }
                .tag(1)
            CalendarView()
                .tabItem {
                    Text("Calendar")
                    Image(systemName: "calendar")
                }
                .tag(2)
            TaskEntryView(tabSelection: $tabSelection)
                .tabItem {
                    Text("Task Entry")
                    Image(systemName: "plus.circle.fill")
                }
                .tag(3)
            CategoryListView()
                .tabItem {
                    Text("Category List")
                    Image(systemName: "square.grid.2x2.fill")
                }
                .tag(4)
            ProfileView()
                .tabItem {
                    Text("Profile")
                    Image(systemName: "person.fill")
                }
                .tag(5)
            
            
        }
        .environmentObject(user)//end body
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
        .preferredColorScheme(.dark)
        
    }
    
    
} //view
    

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .preferredColorScheme(.dark)
//    }
//}

struct CategoryView: View {
    var body: some View {
        NavigationView{
            Text("category view")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        NavigationLink("add", destination: CategoryCreationFormView())
                        
                    }
                }
        }
    }
}








