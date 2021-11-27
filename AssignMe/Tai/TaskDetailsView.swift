//
//  ActualTaskDetailView.swift
//  AssignMe
//
//  Created by Tran, Tai Vinh on 11/14/21.
//

import SwiftUI

struct TaskDetailsView: View {
    @Environment(\.presentationMode) var presentation
    @Binding var showSheet: Bool
    @State var showEdit: Bool = false
    @State private var isActive = false
    @State private var willMoveToNextScreen = false
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var task: TaskEntity
    let formatter = DateFormatter()
    init(task: TaskEntity, showSheet: Binding<Bool>) {
        self.task = task
        formatter.dateFormat = "EEEE, MMMM d, yyyy HH:mm a"
        _showSheet = showSheet
    }
    
    
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            NavigationLink(destination: CategoryListView(), isActive: $showEdit) {
                EmptyView()
            }
            
            Divider()
                .frame(height: 3)
                .background(Color.bright_maroon)
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray)
                .frame(width: 50, height: 5)
                .padding(.vertical, 8)
            
            VStack {
                HStack(){
                    // MARK: Back Button
                    Button(action: {
                        showSheet = false
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
                    
                    Text("Task Details")
                        .font(.custom("Viga-Regular", size: 25))
                        .foregroundColor(.white)
                        .padding(.horizontal,10)
                    
                    Spacer()
                    
                    // MARK: Edit Button
                    Button(action: {
                        print("task edit clicked.")
                        showEdit = true
                    }, label: {
                        Text("Edit")
                            .font(.custom("Ubuntu-Bold", size: 16))
                            .padding(.horizontal, 8)
                            .padding(.vertical, 5)
                    })
                    .sheet(isPresented: $showEdit) {
                        TaskEditView(task: task, showEdit: $showEdit)
                            .environment(\.managedObjectContext, self.managedObjectContext)
                    }
                    .background(Color.bright_maroon)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    // end add button
                }
                .padding(.vertical, 10)
                // end top bar hstack
                
                
                VStack {
                    
                    // MARK: Task Name
                    VStack(spacing: 6) {
                        HStack {
                            Text("Name:")
                                .foregroundColor(.bright_maroon)
                            Spacer()
                        }
                        .font(.custom("Ubuntu-Bold", size: 16))
                        
                        HStack {
                            Text(task.wrappedName)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        
                    }
                    .padding()
                    
                    // MARK: Task Description
                    VStack(spacing: 6) {
                        HStack {
                            Text("Description:")
                                .foregroundColor(.bright_maroon)
                            Spacer()
                        }
                        .font(.custom("Ubuntu-Bold", size: 16))
                        
                        HStack {
                            Text(task.wrappedDesc)
                                .foregroundColor(.white)
                            Spacer()
                        }
                    }
                    .padding()
                    
                    // MARK: Category Selection
                    VStack(spacing: 6) {
                        HStack {
                            Text("Category:")
                                .foregroundColor(.bright_maroon)
                            Spacer()
                        }
                        .font(.custom("Ubuntu-Bold", size: 16))
                        
                        HStack {
                            Text(task.category?.wrappedName ?? "Uncategorized")
                                .foregroundColor(.white)
                            Spacer()
                        }
                    }
                    .padding()
                }
                
                // MARK: Date
                VStack(spacing: 6) {
                    HStack() {
                        Text("Due Date:")
                            .foregroundColor(.bright_maroon)
                            .font(.custom("Ubuntu-Bold", size: 16))
                        Spacer()
                    }
                    HStack {
                        Text(task.dueDate?.description ?? "Error")
                        Spacer()
                    }
                }
                .padding()
                
                VStack(spacing: 6) {
                    HStack() {
                        Text("Difficulty:")
                            .foregroundColor(.bright_maroon)
                            .font(.custom("Ubuntu-Bold", size: 16))
                        Spacer()
                    }
                    
                    HStack {
                        ForEach(0...task.difficulty, id:\.self) { _ in
                            ZStack{
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .foregroundColor(Color.yellow)
                                    .frame(width: 35, height: 35)
                                    .padding(.horizontal, 2)
                                Image(systemName: "star")
                                    .resizable()
                                    .foregroundColor(Color.bg_dark)
                                    .frame(width: 35, height: 35)
                                    .padding(.horizontal, 2)
                            }
                        }
                        Spacer()
                    }
                }
                .padding()
                
                Spacer()
            }
            .font(.custom("Ubuntu-Regular", size: 20))
            .padding(.horizontal)
            
            Spacer()
        }
        .background(Color.bg_dark.ignoresSafeArea())
        .foregroundColor(Color.white)
        // end vstack
    } //body
    
    
    func DeleteTask(){
        self.presentation.wrappedValue.dismiss()
//        user.taskList.remove(at:user.currTaskIndex)
        
    }
    func CompleteTask(){
//        user.completedList.append(user.taskList[user.currTaskIndex])
//        user.taskList.remove(at:user.currTaskIndex)
        self.presentation.wrappedValue.dismiss()
        
    }

} // view

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
