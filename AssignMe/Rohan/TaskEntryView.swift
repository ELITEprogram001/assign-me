//
//  TaskCreationFromView.swift
//  AssignMe
//
//  Created by Rohan Jose on 10/29/21.
//

import SwiftUI

import SwiftUI


private struct FilledButton: ButtonStyle {
    //@Environment(\.isEnabled) private var isEnabled
    
    var isActive: Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : .white)
            .background(isActive ? Color.blue : Color(red: 0.15, green: 0.15, blue: 0.15))
            .cornerRadius(8)
    }
}
private struct BlueButton: View {
    var title: String
    var body: some View {
        Text(title)
            .bold()
            .frame(width:60, height: 40)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
} //view extension

// MARK: Task Entry Struct
struct TaskEntryView: View {
    @State var taskName: String = ""
    @State var taskDesc: String = ""
    @State var currentCategory: String = "Uncategorized"
    @State var currentCategoryIndex: Int = 0
    @State var dueDate: Date = Date()
    @State var difficulty=1
    @State var isActive: Bool = false
    @Binding var tabSelection: Int
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
      entity: CategoryEntity.entity(),
      sortDescriptors: []
    ) var categories: FetchedResults<CategoryEntity>
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            ZStack(alignment: .trailing) {
                HStack() {
                    Spacer()
                    Text("Task Entry")
                        .font(.custom("Viga-Regular", size: 25))
                        .foregroundColor(.white)
                    Spacer()
                }
                
                // MARK: Add Button
                Button("Add"){
                    
                    let task = TaskEntity(context: managedObjectContext)
                    task.name = taskName
                    task.desc = taskDesc
                    task.dueDate = dueDate
                    task.difficulty = Int64(difficulty)
                    
                    for category in categories {
                        if(category.wrappedName == currentCategory) {
                            category.addToTask(task)
                            print("added \(taskName) to category: \(category.wrappedName)")
                        }
                    }
                    
                    try? managedObjectContext.save()
                    
                    // Reset values
                    taskName = ""
                    taskDesc = ""
                    dueDate = Date()
                    difficulty = 1
                    
                }
                .frame(width: 50, height: 30)
                .background(Color.bright_maroon)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal, 10)
                // end add button
                
            }
            .padding(.horizontal)
            // end zstack
            
            
            VStack {
                
                // MARK: Task Name
                VStack{
                    HStack {
                        Text("Name:")
                            .foregroundColor(.bright_maroon)
                        Spacer()
                    }
                    .font(.custom("Ubuntu-Bold", size: 16))
                    
                    TextField("Enter Task Name...", text: $taskName)
                        .padding(.leading, 10)
                        .frame(height: 40)
                        .background(Color.bg_light)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .font(.custom("Ubuntu-Regular", size: 16))
                .padding()
                
                // MARK: Task Description
                VStack{
                    HStack {
                        Text("Description:")
                            .foregroundColor(.bright_maroon)
                        Spacer()
                    }
                    .font(.custom("Ubuntu-Bold", size: 16))
                    
                    TextField("Enter description...", text: $taskDesc)
                        .padding(.leading, 10)
                        .frame(height: 40)
                        .background(Color.bg_light)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .font(.custom("Ubuntu-Regular", size: 16))
                .padding()
                
                // MARK: Category Selection
                VStack {
                    HStack {
                        Text("Category:")
                            .foregroundColor(.bright_maroon)
                        Spacer()
                    }
                    .font(.custom("Ubuntu-Bold", size: 16))
                    
                    Menu("\(currentCategory)"){
                        ForEach(categories) { category in
                            Button(action:{
                                currentCategory = category.wrappedName;
                            }, label:{
                                Text(category.wrappedName)
                            })
                        }
                    }
                    .onAppear{
                        currentCategory = "Uncategorized"; currentCategoryIndex = 0
                    }
                    .foregroundColor(.white)
                    // end menu
                }
                .font(.custom("Ubuntu-Regular", size: 16))
                .padding()
            }
            
            Divider()
                .frame(height: 3)
                .frame(maxWidth: .infinity)
                .background(Color.gray)
            
            // MARK: Date Picker
            VStack {
                HStack() {
                    Text("Due Date:")
                        .foregroundColor(.bright_maroon)
                        .font(.custom("Ubuntu-Bold", size: 16))
                    Spacer()
                }
                
                DatePicker("Pick", selection: $dueDate)
                    .colorScheme(.dark)
                    .labelsHidden()
                    .accentColor(.white)
                    .onAppear{ dueDate = Date() }
            }
            .font(.custom("Ubuntu-Regular", size: 16))
            .padding()
            
            Divider()
                .frame(height: 3)
                .frame(maxWidth: .infinity)
                .background(Color.gray)
            
            VStack {
                HStack() {
                    Text("Difficulty:")
                        .foregroundColor(.bright_maroon)
                        .font(.custom("Ubuntu-Bold", size: 16))
                    Spacer()
                }
                
                DifficultyView(rating: $difficulty)
            }
            .font(.custom("Ubuntu-Regular", size: 16))
            .padding()
            
            Spacer()
        }
        .background(Color.bg_dark.ignoresSafeArea())
        // end VStack
    } // end body
}
