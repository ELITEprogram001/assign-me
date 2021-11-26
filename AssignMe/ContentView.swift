//
//  ContentView.swift
//  AssignMe
//
//  Created by Ridgeway, Dalton D on 10/13/21.
//

import SwiftUI
struct ContentView: View {
///##############################
//    // Test Category
    @State private var tabSelection = 1
    var Uncategorized = Category(name:"Uncategorized",color:Color.gray) //var for uncategorized category that's hidden from CategoriesListView
    
    
//    var task: Task
//    var testing=true
    var user:User = User(name: "Rommie")
    init()
    {
        user.addCategory(cat:Uncategorized) //init for uncategorized category
    }


    //var catList = [Category]()

    var body: some View {
        TabView(selection:$tabSelection){
            //CategoryCreationFormView()
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
            Profile()
                .tabItem {
                    Text("Profile")
                    Image(systemName: "person.fill")
                }
                .tag(5)
        }
        .environmentObject(user)//end body
        .preferredColorScheme(.dark)
       
  //###############################################################################
//            // this is for the category filter view
//        GeometryReader{ geomertry in
//            WeeklyView(tabSelection: 1)
//                .frame(width: geomertry.size.width, height: geomertry.size.height)
//        } //geometryreader
//        
//        ZStack(alignment: .leading) {
//            WeeklyView(tabSelection: 1)
//                .frame(width: geomertry.size.width, height: geomertry.size.height)
//            if self.showMenu {
//                FilterMenu()
//            }
//        }
   //#########################################################################
        
    } //body
    
    
} //view


    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
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








