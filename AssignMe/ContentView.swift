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
//    var task: Task
//    var testing=true
    @State private var tabSelection = 1
    var user:User = User(name: "Rommie")
    init()
    {
        
//        task = Task(name: "push ups", category: Mental_Health, description: "I will do 100 push ups!", difficulty: 5, dueDate: Date(),dateCompleted: Date(), isOverdue: true)
        user.addCategory(cat:Mental_Health)
    }
//    var body: some View {
//
//        if (testing)
//        {
//
//            NavigationView {
//                NavigationLink(destination: TaskDetailsView(task: task)) {
//                            Text("PUSH")
//
//                        }
//            }
//        } //end iff
//    } //end body var
//}
//##################################


    //var catList = [Category]()

    var body: some View {
        TabView(selection: $tabSelection){
            //CategoryCreationFormView()
            WeeklyView()
                .tabItem {
                    Text("Weekly View")
                    Image(systemName: "homekit")
                }
                .tag(1)
            CalendarView()
                .tabItem {
                    Text("calendar")
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


    }.environmentObject(user)//end body

}
    
}

    

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








