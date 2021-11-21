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


struct TaskEntryView: View {
    @State var taskName: String = ""
    @State var taskDesc: String = ""
    @State var currentCategory: String = "Uncategorized"
    @State var dueDate: Date = Date()
    @State var difficulty=1
    @State var isActive: Bool = false
    @Binding var tabSelection: Int
    @EnvironmentObject var user: User
    
    var body: some View {
        ZStack(){
            Color(red: 0.133, green: 0.133, blue: 0.133).edgesIgnoringSafeArea(.all)
            VStack(spacing: 15) {
                HStack(alignment: .center){
                    Spacer()
                    Text("Task Entry")
                        .font(.system(size: 25, weight: .bold, design: .serif))
                        //.padding(.horizontal)
                        .foregroundColor(.white)
                    
                    Button("Add"){
                        let toAdd = Task(
                            name:taskName,
                            category: user.categoryList[0],
                            description:taskDesc,
                            difficulty:difficulty,
                            dueDate:dueDate,
                            dateCompleted:dueDate,
                            isOverdue:false)
                        user.taskList.append(toAdd)
                        self.tabSelection=1
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
                    TextField("Enter Task Description...", text: self.$taskDesc)
                        .frame(height: 55)
                        .textFieldStyle(PlainTextFieldStyle())
                        .background(Color(red: 0.17, green: 0.17, blue: 0.17))
                        .cornerRadius(16)
                        .padding(.horizontal, 25)
                        .foregroundColor(.white)
                    
                    Text("Category:")       //category
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
                    } //menu
                    
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
}
/*
struct TaskCreationFormView_Previews: PreviewProvider {
    static var previews: some View {
        TaskEntryView().preferredColorScheme(.dark)
       
    }
}
*/