//
//  ActualTaskDetailView.swift
//  AssignMe
//
//  Created by Tran, Tai Vinh on 11/14/21.
//

import SwiftUI

struct TaskDetailsView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var user: User
    @State private var isActive = false
    @State private var willMoveToNextScreen = false
    
    var task: Task
    let formatter = DateFormatter()
    init(task:Task) {
        self.task = task
        formatter.dateFormat = "h:mm a - EEEE \n MMM. d, yyyy"
    }
    func getIndex() -> Int {
            if (user.currTaskIndex == user.taskList.count)
            {
                return user.currTaskIndex-1
            }
            return user.currTaskIndex
    }
    
    var body: some View {
        
        ZStack {
            Color(red: 0.150, green: 0.150, blue:0.150).edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 30){
                
                HStack(){
                    Button(action:{
                    
                        isActive = true
                        self.presentation.wrappedValue.dismiss()
                    },label:{
                        
                        Image(systemName: "arrow.backward.circle")
                        .frame(width: 60, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.leading, 15 )

                    })  //button
                    
                    Spacer()
                    Text("Task Details")
                        .bold()
                        .font(.custom("Viga-Regular", size: 25))
                        //.padding(.horizontal,45)
                        .foregroundColor(.white)
                    
                    Spacer()
                    Button(action:{
                        isActive = true
                        willMoveToNextScreen = true
                    },label:{
                        
                        Image(systemName: "square.and.pencil")
                            .frame(width: 60, height: 40)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.trailing, 15 )
                    })  //button
                } //hstack
                
                
                
                VStack(alignment: .leading, spacing: 10){
                    Text("Task Name:")
                        .foregroundColor(.blue)
                        .font(.custom("Chivo-Regular", size: 16))
                    Text( user.taskList[getIndex()].name)
                        .font(.title)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .multilineTextAlignment(.center) //to alight to center
                        .padding(.horizontal)
                    Text("Description:")
                        .font(.custom("Chivo-Regular", size: 16))
                        .foregroundColor(.blue)
                    Text( user.taskList[getIndex()].description)
                        .lineLimit(2)
                        //.multilineTextAlignment(.center) //to alight to center
                        .padding(.horizontal)
                    
                    
/* catergory*/      Text("Category Name:")
                        .foregroundColor(.blue)
                        .font(.custom("Chivo-Regular", size: 16))
                    HStack(alignment: .center){
                        //Spacer()
                        Text(  "\(task.category.name )" )
                            .font(.custom("Montserrat-Regular", size: 26))
                            .padding()
                            .foregroundColor(task.category.color)
                        Spacer()
                    } //hstack Category
                    
                    
                    
                    Group{
                        
                    Text("Due Date:")
                        .font(.custom("Chivo-Regular", size: 16))
                        .foregroundColor(.blue)
            
                   // Text("\( user.taskList[user.currTaskIndex].dueDate)")
                    HStack{
                        Spacer()
                        Text("\(formatter.string(from:task.dueDate))")
                            .font(.custom("Montserrat-Regular", size: 24))
                            .lineLimit(2)
                            .frame(width: 300)
                            .multilineTextAlignment(.center) //to alight to center
                        Spacer()
                    }
                    
                        
                    Text("Difficulty:")
                        .font(.custom("Chivo-Regular", size: 16))
                        .foregroundColor(.blue)
                    HStack( spacing: 1){
                        let starCount =  user.taskList[getIndex()].difficulty
                        ForEach (1...starCount, id:\.self) { _ in
                            Image(systemName: "star.fill")
                            .resizable()
                            .foregroundColor(Color.yellow)
                            .frame(width: 45,height: 45)
                        }
                        .padding(.horizontal, 10 )
                    } //hstack
                    .padding()
                    
                    
//                        Text("Category Name:")
//                            .foregroundColor(.blue)
//                            .font(.custom("Chivo-Regular", size: 16))
//                        HStack(alignment: .center){
//                            Spacer()
//                            Text(  "\(task.category.name )" )
//                                .font(.custom("Montserrat-Regular", size: 30))
//                                .padding()
//                                .foregroundColor(task.category.color)
//                            Spacer()
//                        } //hstack Category
                        Spacer()
                        HStack{
                            Spacer()
                                
                            Button("Delete",action:{
                                DeleteTask()
                            })
                                .font(.custom("Chivo-Regular", size: 20))
                                .frame(width: 130, height: 50)
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            Spacer()
                            Button("Complete",action:{
                                CompleteTask()
                            })
                                .font(.custom("Chivo-Regular", size: 20))
                                .frame(width: 130, height: 50)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            Spacer()
                        } // hstack
                        Spacer()
                    }
                    
                } //vstack
                .frame(width: 370 , alignment: .leading)
                .font(.title2)
                Spacer()
            } //vstack
            .frame(width: 370)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            //.ignoresSafeArea()
        }
        
        .navigationBarTitle("")
        .navigationBarHidden(true)
        
        .navigate(to: TaskEditView(task: user.taskList[getIndex()]).navigationBarHidden(true), when: $willMoveToNextScreen)
        //Zstack
        //.ignoresSafeArea(.all)
    } //body
    
    
    func DeleteTask(){
        self.presentation.wrappedValue.dismiss()
        user.taskList.remove(at:user.currTaskIndex)
        
    }
    func CompleteTask(){
        user.completedList.append(user.taskList[user.currTaskIndex])
        user.taskList.remove(at:user.currTaskIndex)
        self.presentation.wrappedValue.dismiss()
        
    }
    
}// view

//struct ActualTaskDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        //ActualTaskDetailView(task: TaskList.allTask.first!).preferredColorScheme(.dark)
//        //TaskDetailsView(task:Task).preferredColorScheme(.dark)
//    }
//}
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
                    .navigationBarHidden(true)
                
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
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}   //extension view
