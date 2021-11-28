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
    @State var difficulty: Int64 = 1
    @State var isActive: Bool = false
//    @EnvironmentObject var user: UserOld
    var task: TaskEntity
    @Binding var showEdit: Bool
    
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
      entity: CategoryEntity.entity(),
      sortDescriptors: []
    ) var categories: FetchedResults<CategoryEntity>
    
    init(task: TaskEntity, showEdit: Binding<Bool>){
        self.task = task
        _taskName = State(initialValue: task.wrappedName)
        _taskDesc = State(initialValue: task.wrappedDesc)
        _currentCategory = State(initialValue: task.category?.wrappedName ?? "")
        _dueDate = State(initialValue: task.dueDate ?? Date())
        _difficulty = State(initialValue: task.difficulty)
        _showEdit = showEdit
    }
    var body: some View {
        VStack(spacing: 0) {
            
            
            Divider()
                .frame(height: 3)
                .background(Color.bright_maroon)
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray)
                .frame(width: 50, height: 5)
                .padding(.vertical, 8)
            
            // Top Bar
            ZStack {
                HStack(){
                    // MARK: Back Button
                    Button(action: {
                        showEdit = false
                    }, label: {
                        ZStack() {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.bright_maroon)
                                .frame(width: 40, height: 30)
                            Image(systemName: "arrow.backward")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding()
                        } // end label zstack
                    })  //button
                    
                    Spacer()
                    
                    // MARK: Update Button
                    Button(action: {
                        task.name = taskName
                        task.desc = taskDesc
                        task.dueDate = dueDate
                        task.difficulty = Int64(difficulty)
                        
                        if(currentCategory != task.category?.wrappedName) {
                            for category in categories {
                                if(category.wrappedName == currentCategory) {
                                    task.category?.removeFromTask(task)
                                    task.category = category
                                    break
                                }
                            }
                        }
                        
                        try? managedObjectContext.save()
                        
                        showEdit = false
                    }, label: {
                        Text("Update")
                            .font(.custom("Ubuntu-Bold", size: 16))
                            .padding(.horizontal, 8)
                            .padding(.vertical, 5)
                    })
                    .background(Color.bright_maroon)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    // end update button
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                // end top bar hstack
                
                Text("Task Editing")
                    .font(.custom("Viga-Regular", size: 25))
                    .foregroundColor(.white)
                    .padding(.horizontal,10)
            } // end top bar zstack
            
            
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
                        currentCategory = task.category?.wrappedName ?? "Error"
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
                
                HStack {
                    ForEach(1...5, id: \.self){ number in
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                            .foregroundColor(number > difficulty ? .bg_light : .yellow)
                            .onTapGesture {
                                difficulty = Int64(number)
                            }
                        
                    }
                }
            }
            .font(.custom("Ubuntu-Regular", size: 16))
            .padding()
            
            Spacer()
        }
        .background(Color.bg_dark.ignoresSafeArea())
        // end VStack
    }
}


//struct TaskEditFormView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskDetailsView(task: ).preferredColorScheme(.dark)
//
//    }
//}
