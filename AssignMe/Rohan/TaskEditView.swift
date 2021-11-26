//
//  TaskDetailsView.swift
//  AssignMe
//
//  Created by Rohan Jose on 11/4/21.
//
import SwiftUI

struct TaskEditView: View {
    @State var taskName: String = ""
    @State var taskDesc: String = ""
    @State var currentCategory: String = "Uncategorized"
    @State var dueDate: Date = Date()
//    @State var difficulty=1
    @State var isActive: Bool = false
//    @EnvironmentObject var user: UserOld
    var task: TaskEntity
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
      entity: CategoryEntity.entity(),
      sortDescriptors: []
    ) var categories: FetchedResults<CategoryEntity>
    
    init(task: TaskEntity){
        self.task = task
        _taskName = State(initialValue: task.wrappedName)
        _taskDesc = State(initialValue: task.wrappedDesc)
        _currentCategory = State(initialValue: task.category?.wrappedName ?? "")
        _dueDate = State(initialValue: task.dueDate ?? Date())
//        _difficulty = State(initialValue: task.difficulty)
    }
    var body: some View {
        ZStack(){
            Color(red: 0.150, green: 0.150, blue:0.150).edgesIgnoringSafeArea(.all)
            VStack() {
                HStack(alignment: .center, spacing: 40){
                    
                    Button(action:{
                        isActive = true
                        self.presentation.wrappedValue.dismiss()
                    },label:{
                        Image(systemName: "arrow.backward.circle")
                            .frame(width: 60, height: 40)
                        
                    })
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.leading,55)
                    Text("Task Edit")
                        .bold()
                        .font(.custom("Viga-Regular", size: 25))
                        .foregroundColor(.white)
                        .frame(width:120, height: 40)
                        .padding(.horizontal, 10)
                    Button("Save"){
//                        user.taskList[user.currTaskIndex].name=taskName
//                        user.taskList[user.currTaskIndex].category=user.categoryList[user.indexCatList]
//                        user.taskList[user.currTaskIndex].description=taskDesc
//                        user.taskList[user.currTaskIndex].dueDate=dueDate
//                        user.taskList[user.currTaskIndex].difficulty=difficulty
                        self.presentation.wrappedValue.dismiss()
                    }.frame(width: 60, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.trailing, 55)
                    
                } //hstack
                
                Group{
                    Text("Name:")
                        .foregroundColor(.blue)
                    TextField("Enter Task Name...", text: self.$taskName, onCommit: {
                        isActive=true
                    })
                        .frame(height: 55)
                        .textFieldStyle(PlainTextFieldStyle())
                        .background(Color(red: 0.17, green: 0.17, blue: 0.17))
                        .padding([.horizontal], 4)
                        .cornerRadius(16)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                        .padding(.horizontal, 40)
                        .foregroundColor(.white)
                    Text("Description:")
                        .foregroundColor(.blue)
                    TextField("Enter Task Description...", text: $taskDesc)
                        .frame(height: 55)
                        .textFieldStyle(PlainTextFieldStyle())
                        .background(Color(red: 0.17, green: 0.17, blue: 0.17))
                        .padding([.horizontal], 4)
                        .cornerRadius(16)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                        .padding(.horizontal, 40)
                        .foregroundColor(.white)
                    Text("Category:")
                        .foregroundColor(.blue)
                    Menu("\(currentCategory)"){
                        Picker(selection: $currentCategory, label: Text("Category options")) {
                            ForEach(categories.indices) { categoryIndex in
                                Text(categories[categoryIndex].wrappedName).tag(categoryIndex)
                            }
                        }
                    } // end menu
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)
                    Rectangle()
                        .fill(Color.black)
                        .frame(width:340, height:1)
                        .padding(.horizontal, 30)
                } //group
                Text("Due Date:")
                    .foregroundColor(.blue)
                DatePicker("", selection: $dueDate)
                    .labelsHidden()
                    .accentColor(.white)
                    .colorScheme(.dark)
                Rectangle()
                        .fill(Color.black)
                        .frame(width:340, height:1)
                        .padding(.horizontal, 30)
                Text("Difficulty:")
                    .foregroundColor(.blue)
//                DifficultyView(rating: $difficulty)
                Spacer()
            }
    
        }
        .navigationBarTitle("")
       .navigationBarHidden(true)
    }
}


//struct TaskEditFormView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskDetailsView(task: ).preferredColorScheme(.dark)
//
//    }
//}
