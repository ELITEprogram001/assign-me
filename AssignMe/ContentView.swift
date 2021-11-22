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
    var Mental_Health = Category(name:"Uncategorized",color:Color.gray)
    let testCat1 = Category(name: "Recreation", color: .red)
    let testCat2 = Category(name: "Mental Health", color:.blue)
    let testCat3 = Category(name: "Spiritual Health", color: .yellow)
    let testCat4 = Category(name: "Pls send help", color:.green)
    let testCat5 = Category(name: "School and Work", color: .orange)
    let testCat6 = Category(name: "Family and Relationships", color: .purple)
    
    
    
//    var task: Task
//    var testing=true
    var user:User = User(name: "Rommie")
    init()
    {
        
//        task = Task(name: "push ups", category: Mental_Health, description: "I will do 100 push ups!", difficulty: 5, dueDate: Date(),dateCompleted: Date(), isOverdue: true)
        
        
        user.addCategory(cat:Mental_Health)
        user.addCategory(cat:testCat1)
        user.addCategory(cat:testCat2)
        user.addCategory(cat:testCat3)
        user.addCategory(cat:testCat4)
        user.addCategory(cat:testCat5)
        user.addCategory(cat:testCat6)
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
            TaskEntryView()
                .tabItem {
                    Text("Task Entry")
                    Image(systemName: "plus.circle.fill")
                }
            CategoryListView()
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








