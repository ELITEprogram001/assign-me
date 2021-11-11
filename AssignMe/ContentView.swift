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
    var Mental_Health = Category(name:"Mental Health",color:Color.red)
//    var testing=true
    var user:User = User(name: "Rommie")
    init()
    {
        user.addCategory(cat:Mental_Health)
    }
//    var body: some View {
//
//        if (testing)
//        {
//
//            NavigationView {
//                NavigationLink(destination: TaskCreationFormView(user:user)) {
//                            Text("PUSH")
//                                .foregroundColor(Color.black)
//                        }
//            }
//        }//end iff
//    }//end body var
//##################################
    
    //var catList = [Category]()
    
    
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
            TaskCreationFormView()
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


    }.environmentObject(user)//end body

}
    
}

    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}


//////

///#################### embedded view within a view JUST A PLACE HOLDER for other view File


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







