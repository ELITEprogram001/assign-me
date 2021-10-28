//
//  ContentView.swift
//  AssignMe
//
//  Created by Ridgeway, Dalton D on 10/13/21.
//

import SwiftUI
struct ContentView: View {

    
    var body: some View {

        TabView{
            //CategoryCreationFormView()
            WeeklyView()
                .tabItem {
                    Text("Weekly View")
                    Image(systemName: "homekit")
                }
            CalendarView()
                .tabItem {
                    Text("calendar")
                    Image(systemName: "calendar")
                }
            TaskEntry()
                .tabItem {
                    Text("Task Entry")
                    Image(systemName: "plus.circle.fill")
                }
            CategoryView()
                .tabItem {
                    Text("Category List")
                    Image(systemName: "square.grid.2x2.fill")
                }
            Profile()
                .tabItem {
                    Text("Profile")
                    Image(systemName: "person.fill")
                }

        }   //end tabview
    }//end body
    
}//end Contenview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



///#################### embedded view within a view JUST A PLACE HOLDER
struct WeeklyView: View {
    var body: some View {
        Text("Weekly VIEW")
    }
}

struct CalendarView: View {
    var body: some View {
        Text(" Calendar VIEW")
    }
}

struct TaskEntry: View {
    var body: some View {
        Text("TASK ENTRY")
    }
}

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
struct Profile: View {
    var body: some View {
        Text("Profile")
    }
}




