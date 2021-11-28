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
    var Uncategorized = Category(name:"Uncategorized",color:Color.gray) //var for uncategorized category that's hidden from CategoriesListView
    
    
    var user:User = User(name: "User")
    init()
    {
        
        // TODO implement persistent data - or waste 12-16 hours creating the whole app again with persistent data.
        user.addCategory(cat:Uncategorized) //init for uncategorized category
        var sample = Task(name: "push ups", category: Uncategorized, description: "I will do 100 push ups!", difficulty: 5, dueDate: Date(), dateCompleted: Date(), isOverdue: true)
        var sample2 = Task(name: "push downs", category: Uncategorized, description: "I will do 100 push ups!", difficulty: 5, dueDate: Calendar.current.date(byAdding: .day, value: -7, to: Date()) ?? Date(), dateCompleted: Date(), isOverdue: true)
        var sample3 = Task(name: "push sides", category: Uncategorized, description: "I will do 100 push ups!", difficulty: 5, dueDate: Calendar.current.date(byAdding: .day, value: 14, to: Date()) ?? Date(), dateCompleted: Date(), isOverdue: true)
        user.taskList.append(sample)
        user.taskList.append(sample2)
        user.completedList.append(sample3)
        
        // Creating Achievements
        user.achievements.append(Achievement(
                                    name: "Redemption",
                                    desc: "Complete 3 tasks that were overdue.",
                                    image: "strength",
                                    progress: 0.6))
        user.achievements.append(Achievement(
                                    name: "Overachiever",
                                    desc: "Complete 5 tasks that aren't due for another week.",
                                    image: "fire",
                                    progress: 0.1))
        user.achievements.append(Achievement(
                                    name: "First Steps",
                                    desc: "Complete your first task!",
                                    image: "stairs",
                                    progress: 1.0))
        user.achievements.append(Achievement(
                                    name: "Dedicated",
                                    desc: "Complete 4 tasks for one category back to back.",
                                    image: "strength",
                                    progress: 0.6))
        user.achievements.append(Achievement(
                                    name: "The Planner",
                                    desc: "Plan your first 3 tasks.",
                                    image: "brain",
                                    progress: 0.6))
        user.achievements.append(Achievement(
                                    name: "Take a break",
                                    desc: "Complete 3 tasks in 1 hour.",
                                    image: "stopwatch",
                                    progress: 0.6))
        
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
        .environmentObject(user)//end body
        .preferredColorScheme(.dark)
        
    }
    
} //view


    

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .preferredColorScheme(.dark)
//    }
//}

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








