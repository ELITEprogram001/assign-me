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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
