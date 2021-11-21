//
//  ActualTaskDetailView.swift
//  AssignMe
//
//  Created by Tran, Tai Vinh on 11/14/21.
//

import SwiftUI
extension Int: Sequence {
    public func makeIterator() -> CountableRange<Int>.Iterator {
        return (0..<self).makeIterator()
    }
}
extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is true.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
    }
}
struct TaskDetailsView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var user: User
    @State private var isActive = false
    @State private var willMoveToNextScreen = false
    func DeleteTask(){
        user.taskList.remove(at:user.currTaskIndex)
        self.presentation.wrappedValue.dismiss()
    }
    func CompleteTask(){
        user.completedList.append(user.taskList[user.currTaskIndex])
        user.taskList.remove(at:user.currTaskIndex)
        self.presentation.wrappedValue.dismiss()
    }
    var body: some View {
        ZStack {
            Color(red: 0.150, green: 0.150, blue:0.150).edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 40){
                
                HStack(){
                    Button(action:{
                        isActive = true
                        //user.taskList.remove(at:user.currTaskIndex)
                        /*
                        var index=0
                        for taskelem in user.taskList {
                            if (taskelem.id == user.currTask.id)
                            {
                                user.taskList.remove(at:index)
                                break
                            }
                            index=index+1
                        }
                         */
                        self.presentation.wrappedValue.dismiss()
                    },label:{
                        
                        Image(systemName: "square.and.pencil")
                        .frame(width: 60, height: 40)
                    })  //button
                    //.frame(width: 60, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    Spacer()
                    Text("Task Detail")
                        .font(.system(size: 25, weight: .bold, design: .serif))
                        .padding(.horizontal,45)
                        .foregroundColor(.white)
                    Button(action:{
                        isActive = true
                        willMoveToNextScreen = true
                    },label:{
                        
                        Image(systemName: "square.and.pencil")
                        .frame(width: 60, height: 40)
                    })  //button
                    //.frame(width: 60, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                } //hstack
                
        
                
                VStack(alignment: .leading, spacing: 25){
                    Text("Task Name:")
                        .foregroundColor(.blue)
                    
                    Text(user.currTask.name)
                        .font(.title)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .multilineTextAlignment(.center) //to alight to center
                        .padding(.horizontal)
                    Text("Description:")
                        .foregroundColor(.blue)
                    Text(user.currTask.description)
                        .lineLimit(2)
                        .multilineTextAlignment(.center) //to alight to center
                        .padding(.horizontal)
                    Text("Due Date:")
                        .foregroundColor(.blue)
                    Text("\(user.currTask.dueDate)")
                        .lineLimit(2)
                        .multilineTextAlignment(.center) //to alight to center
                        .padding(.horizontal)
                    Text("Difficulty:")
                        .foregroundColor(.blue)
                    
                    HStack( spacing: 1){
                        let starCount = user.currTask.difficulty
                        ForEach (1...starCount, id:\.self) { _ in
                            Image(systemName: "star.fill")
                                .resizable()
                                .foregroundColor(Color.yellow)
                                .frame(width: 45,height: 45)
                        }.padding(.horizontal, 10 )
                    } //hstack
                    .padding()
                    
                    Text("Category:")
                        .foregroundColor(.blue)
//                    Text(task.category)
//                        .font(.title)
//                        .lineLimit(2)
//                        .multilineTextAlignment(.center) //to alight to center
//                        .padding(.horizontal)
                    HStack(){
                    Text("Over Due ?:")
                        .foregroundColor(.blue)
                        Button("Delete Task",action:{
                            DeleteTask()
                        })
                        Button("Complete Task",action:{
                            CompleteTask()
                        })
                    }
//                    Text(task.isOverdue)
//                        .font(.title)
//                        .lineLimit(2)
//                        .multilineTextAlignment(.center) //to alight to center
//                        .padding(.horizontal)
                } //vstack
                .frame(width: 370 , alignment: .leading)
                .font(.title2)
                Spacer()
            } //vstack
            .frame(width: 370)
            .navigationBarHidden(true)
            //.ignoresSafeArea()
        }
        .navigationBarHidden(true)
        .navigate(to: TaskEditView(task:user.currTask).navigationBarHidden(true), when: $willMoveToNextScreen)
//Zstack
       //.ignoresSafeArea(.all)
    }
}

struct ActualTaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //ActualTaskDetailView(task: TaskList.allTask.first!).preferredColorScheme(.dark)
        TaskDetailsView().preferredColorScheme(.dark)
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