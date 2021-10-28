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
            //Weekly()
                .tabItem {
                    Text("default")
                    Image("home-alt-plus")
                }
            //Calendar()
                .tabItem {
                    Text("calendar")
                    Image(systemName: "calendar")
                }
            //TaskEntry()
                .tabItem {
                    Text("Task Entry")
                    Image(systemName: "plus.app.fill").imageScale(.large)
                }
            //Category()
                .tabItem {
                    Text("Category List")
                    Image(systemName: "")
                }
            //Profile()
                .tabItem {
                    Text("Profile")
                    Image(systemName: "person.fill")
                }

        }//end body
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
