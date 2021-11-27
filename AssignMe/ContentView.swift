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
    @State var showTaskEntry: Bool = false
    
    //var for uncategorized category that's hidden from CategoriesListView
    var Uncategorized = Category(name:"Uncategorized",color:Color.gray)
    
    let persistenceController = PersistenceController.shared
    
//    @FetchRequest(
//      entity: UserEntity.entity(),
//      sortDescriptors: []
//    ) var u: FetchedResults<UserEntity>
    
    init()
    {
        
        
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
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
        .preferredColorScheme(.dark)
        
    }
    
    
} // end content view
    


//struct CategoryView: View {
//    var body: some View {
//        NavigationView{
//            Text("category view")
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarTrailing) {
//
//                        NavigationLink("add", destination: CategoryCreationFormView())
//
//                    }
//                }
//        }
//    }
//}








