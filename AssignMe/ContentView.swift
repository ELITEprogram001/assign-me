//
//  ContentView.swift
//  AssignMe
//
//  Created by Ridgeway, Dalton D on 10/13/21.
//

import SwiftUI
struct ContentView: View {
<<<<<<< HEAD
    // Test Category
    var Mental_Health = Category(name:"Mental Health",color:"Blue")
    var testing=true
    var body: some View {
        /*
        NavigationView {
                    NavigationLink(destination: CategoryCreationFormView()){
                        Text("Calendar View")
                    }
        }
        */
        if (testing)
        {

<<<<<<< HEAD
            NavigationView {
                        NavigationLink(destination: CategoryCreationFormView()) {
                            Text("PUSH")
                                .foregroundColor(Color.black)
                        }
            }
            
=======
    
    var body: some View {
        TabView{
            Weekly()
                .tabItem {
                    Text("default")
                    Image("home-alt-plus")
                }
            Calendar()
                .tabItem {
                    Text("calendar")
                    Image(systemName: "calendar")
                }
            TaskEntry()
                .tabItem {
                    Text("Task Entry")
                    Image(systemName: "plus.app.fill").imageScale(.large)
                }
            Category()
                .tabItem {
                    Text("Category List")
                    Image(systemName: "")
                }
            Profile()
                .tabItem {
                    Text("Profile")
                    Image(systemName: "person.fill")
                }
>>>>>>> 7acf0f75e7d7fc1728117518f1eb576714d90776
        }
    }
}
=======
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
>>>>>>> Navigation-Bar

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)//dark mode
    }
}



///#################### embedded view within a view JUST A PLACE HOLDER for other view File
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




