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
        ZStack(){
            Color(red: 0.150, green: 0.150, blue: 0.150).edgesIgnoringSafeArea(.all)
            VStack(spacing: 15) {
                HStack(alignment: .center){
                   
                    Text("Task Entry")
                        .bold()
                        .font(.custom("Viga-Regular", size: 25))
                        .padding(.leading,140 )
                        .foregroundColor(.white)
                    Spacer()
                    
                    Button("Add"){
                        
                        let task = TaskEntity(context: managedObjectContext)
                        task.name = taskName
                        task.desc = taskDesc
                        task.dueDate = Date()
                        
                        
                        for category in categories {
                            if(category.wrappedName == currentCategory) {
                                category.addToTask(task)
                                print("added \(taskName) to category: \(category.wrappedName)")
                            }
                        }
                        
                        try? managedObjectContext.save()
                        
                        /* Old Task Add
                        let toAdd = Task(
                            name:taskName,
                            category: user.categoryList[currentCategoryIndex],
                            description:taskDesc,
                            difficulty:difficulty,
                            dueDate:dueDate,
                            dateCompleted:dueDate,
                            isOverdue:false)
                        user.taskList.append(toAdd)
                        self.tabSelection=1
                        taskName = ""
                        taskDesc = ""
                        difficulty = 1
                        */
                    } //button
                    .frame(width: 60, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal,30)
                    
                } //hstack
                
                Group{
                    Text("Name:")           //task name
                        .foregroundColor(.blue)
                    TextField("   Enter Task Name...", text: self.$taskName, onCommit: {
                        isActive=true
                    })
                    .frame(height: 55)
                    .background(Color(red: 0.17, green: 0.17, blue: 0.17))
                    .cornerRadius(16)
                    .padding(.horizontal, 24)
                    .foregroundColor(.white)
                    
                    Text("Description:")        //description
                        .foregroundColor(.blue)
                    TextField("   Enter Task Description...", text: self.$taskDesc)
                        .frame(height: 55)
                        .textFieldStyle(PlainTextFieldStyle())
                        .background(Color(red: 0.17, green: 0.17, blue: 0.17))
                        .cornerRadius(16)
                        .padding(.horizontal, 25)
                        .foregroundColor(.white)
                    
                    Text("Category:")       //category
                        .foregroundColor(.blue)
                    Menu("\(currentCategory)"){
                        ForEach(categories) { category in
                            Button(action:{
                                currentCategory = category.wrappedName;
                            }, label:{
                                Text(category.wrappedName)
                            })
                        }
                    } //menu
                    .onAppear{currentCategory = "Uncategorized"; currentCategoryIndex = 0}
                    
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                    Rectangle()
                        .fill(Color.black)
                        .frame(width:340, height:1)
                        .padding(.horizontal, 30)
                }
                Text("Due Date:")   //due date
                    .foregroundColor(.blue)
                DatePicker("", selection: $dueDate)
                    .labelsHidden()
                    .accentColor(.white)
                    .colorScheme(.dark)
                    .onAppear{dueDate = Date()}
                Rectangle()
                        .fill(Color.black)
                        .frame(width:340, height:1)
                        .padding(.horizontal, 30)
                
                Text("Difficulty:")     //difficulty
                    .foregroundColor(.blue)
                DifficultyView(rating: $difficulty)
                Spacer()
            }
    
        }
       .navigationBarHidden(true)

    }
    
    func saveContext() {
      do {
        try managedObjectContext.save()
      } catch {
        print("Error saving managed object context: \(error)")
      }
    }
    
    func addUser(name: String) {
//        let u = UserEntity(context: managedObjectContext)
//
//        u.name = name
//
//        saveContext()
    }
    
    func deleteCategory(name: String) {
        
        for category in categories {
            if(category.wrappedName == name) {
                self.managedObjectContext.delete(category)
            }
        }
        
        saveContext()
    }
}
/*
struct TaskCreationFormView_Previews: PreviewProvider {
    static var previews: some View {
        TaskEntryView().preferredColorScheme(.dark)
       
    }
}
*/
