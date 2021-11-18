//
//  TaskDetailsView.swift
//  AssignMe
//
//  Created by Rohan Jose on 11/4/21.
//
import SwiftUI
//
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



struct TaskDetailsView: View {
    @State var taskName: String
    @State var taskDesc: String = ""
    @State var currentCategory: String = "Uncategorized"
    @State var dueDate: Date = Date()
    @State var difficulty=1
    @State var isActive: Bool = false
    var task:Task
    init(task:Task){
        self.task=task
        _taskName = State(initialValue: task.name)
        _taskDesc = State(initialValue: task.description)
        _currentCategory = State(initialValue: task.category.name)
        _dueDate = State(initialValue: task.dueDate)
        _difficulty = State(initialValue: task.difficulty)
    }
    var body: some View {
        ZStack(){
            Color(red: 0.133, green: 0.133, blue: 0.133).edgesIgnoringSafeArea(.all)
            VStack() {
                HStack(){
                    Spacer()
                    Button("Back"){
                        
                    }
                    //.buttonStyle(FilledButton(isActive: false))
                    .frame(width: 60, height: 40)
                    .padding(.leading,5)
                    .background(Color(red: 0.17, green: 0.17, blue: 0.17))
                    .foregroundColor(.gray)
                    .cornerRadius(10)
                    Spacer()
                    Text("Task Details")
                        .font(.system(size: 25, weight: .bold, design: .serif))
                        .foregroundColor(.white)
                    Spacer()
                    Button("Save"){
                        
                    }.frame(width: 60, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    //.buttonStyle(FilledButton(isActive: isActive))
                    .padding(.trailing,5)
                    Spacer()
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
                        .padding([.horizontal], 24)
                        .foregroundColor(.white)
                    Text("Description:")
                        .foregroundColor(.blue)
                    TextField("Enter Task Description...", text: self.$taskDesc)
                        .frame(height: 55)
                        .textFieldStyle(PlainTextFieldStyle())
                        .background(Color(red: 0.17, green: 0.17, blue: 0.17))
                        .padding([.horizontal], 4)
                        .cornerRadius(16)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                        .padding([.horizontal], 24)
                        .foregroundColor(.white)
                    Text("Category:")
                        .foregroundColor(.blue)
                    Menu("\(currentCategory)"){
                        Button(action:{currentCategory="Mental Health" }, label:{
                            Text("Mental Health")
                            
                        })
                        Button(action:{currentCategory="Physical Health" }, label:{
                            Text("Physical Health")
                            
                        })
                        Button(action:{currentCategory="Financial" }, label:{
                            Text("Financial")
                            
                        })
                        Button(action:{currentCategory="Spiritual" }, label:{
                            Text("Spiritual")
                            
                        })
                    }   //menus
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
                DifficultyView(rating: $difficulty)
                Spacer()
            }
    
        }
       .navigationBarHidden(true)

    }
}


//struct TaskEditFormView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskDetailsView(task: ).preferredColorScheme(.dark)
//
//    }
//}
