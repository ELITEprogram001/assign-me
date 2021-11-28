//
//  ContentView.swift
//  AssignMe
//
//  Created by Ridgeway, Dalton D on 10/13/21.
//

import SwiftUI
struct ContentView: View {
    @State private var tabSelection = 1
    @State var showTaskEntry: Bool = false
    
    let persistenceController = PersistenceController.shared

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
    









