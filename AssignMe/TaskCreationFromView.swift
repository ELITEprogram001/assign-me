//
//  TaskCreationFromView.swift
//  AssignMe
//
//  Created by Rohan Jose on 10/29/21.
//

import SwiftUI

import SwiftUI

struct TaskCreationFormView: View {
    @State var taskName: String = ""
    @State var taskDesc: String = ""
    @State var currentCategory: String = "Uncategorized"
    @State var dueDate: Date = Date()
    @State var difficulty=1
    @State var isActive: Bool = false
    @EnvironmentObject var user: User
    var body: some View {
        ZStack(){
            Color(red: 0.133, green: 0.133, blue: 0.133).edgesIgnoringSafeArea(.all)
            VStack() {
                HStack(){
                Spacer()
                Button("Back"){
                        
                    }
                    .buttonStyle(FilledButton(isActive: false))
                    .padding(.leading,15)
                Spacer()
                    Text("Task Entry")
                    .font(.system(size: 25, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                Spacer()
                Button("Add"){
                    var toAdd = Task( name:taskName, description:taskDesc, dueDate:dueDate, difficulty:difficulty, dateCompleted:dueDate, isOverdue:false, category: )
                    }
                    .buttonStyle(FilledButton(isActive: isActive))
                    .padding(.trailing,15)
                Spacer()
                }
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
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                Rectangle()
                        .fill(Color.black)
                        .frame(width:340, height:1)
                        .padding(.horizontal, 30)
                }
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


