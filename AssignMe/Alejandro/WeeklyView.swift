//
//  SwiftUIView.swift
//  AssignMe
//
//  Created by Santos, Alejandro on 11/3/21.
//

import SwiftUI


var task: [Task] = TaskList.taskArray


struct WeeklyView: View {
    @State var showMenu = false //to determine if the showMenu is true then the  MenuView show on top of MainView by using ZStack
    
    @EnvironmentObject var user: User
    @State var tabSelection: Int
    var body: some View {
    
        
        
        let drag = DragGesture()// this to close the Side MEnu by dragging from right to left
            .onEnded{
                if $0.translation.width < -200{ //if pixel less then -100 ??
                    withAnimation{
                        self.showMenu = false
                    }
                }
            } //onEnded

        return NavigationView{
            ZStack{ Color(red: 0.150, green: 0.150, blue:0.150).edgesIgnoringSafeArea(.all)
                GeometryReader { geometry in
                    Button(action: {
                        withAnimation{
                            self.showMenu.toggle()
                        }
                    }, label: {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .frame(width: 30 ,height: 30)
                    })   //))
                    .padding(.leading, 320)
                    ScrollView{
                        ForEach(1..<user.taskList.count, id: \.self) { index in
                            NavigationLink(destination: TaskDetailsView(task: user.taskList[index] )
                                .environmentObject(user)
                                .onAppear {
                                    user.currTask = user.taskList[index]
                                    user.currTaskIndex = index
                                    for index in 0..<user.categoryList.count{
                                        if (user.taskList[user.currTaskIndex].category.id == user.categoryList[index].id) {
                                            user.indexCatList = index
                                        }
                                    }
                                },
                               label:{
                                TaskCard(task: user.taskList[index])
                                    .ignoresSafeArea(.all)
                               })
                            Spacer()
                            
                        } //foreach
 
                    } //scroll view
                    .padding(.top, 30)
                        .gesture(drag)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        //.offset(x: self.showMenu ? geometry.size.width/2 : 0)   //this to push the MainView to the right
                        .disabled(self.showMenu ? true : false)
                    
                    if self.showMenu{
                        FilterMenu()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    } //if
                } //geometry reader
                .navigationBarTitle("")
                .navigationBarHidden(true)
                
                //######################################hamburger button
//                    Button(action: {
//                        withAnimation{
//                            self.showMenu.toggle()
//                        }
//                    }, label: {
//                        Image(systemName: "line.horizontal.3")
//                            .imageScale(.large)
//                            .frame(width: 30 ,height: 30)
//                    })   //))
//
//                    .padding(.leading, 320)
//                    .padding(.top, 620)
                //####################################################
                
                
                
            } //ZStack
            
            .onAppear{
                user.taskList.append(Task(
                    name:"",
                    category:user.categoryList[0],
                    description:"",
                    difficulty: 1,
                    dueDate: Date(),
                    dateCompleted: Date(),
                    isOverdue: false ))
                user.taskList.removeLast()
                user.taskList = user.taskList.sorted(by: {
                    $0.dueDate.compare($1.dueDate) == .orderedAscending
                })
            }
        } //navigation View
        
        
    }//body
    
} //weeklyview


struct MainView : View{
    @Binding var showMenu: Bool
    var body: some View{
            Text("")
    }
}


struct WeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyView(tabSelection: 1)
            .environmentObject(User.init(name: ""))
            .preferredColorScheme(.dark)
    }
}

//################################################# original code

//NavigationView{
//    ZStack{
//        Color(red: 0.150, green: 0.150, blue:0.150).edgesIgnoringSafeArea(.all)
//        VStack{
//            ScrollView{
//                ForEach(1..<user.taskList.count, id: \.self) { index in
//                    NavigationLink(destination: TaskDetailsView(task: user.taskList[index] )
//                        .environmentObject(user)
//                        .onAppear {
//                            user.currTask = user.taskList[index]
//                            user.currTaskIndex = index
//                            for index in 0..<user.categoryList.count{
//                                if (user.taskList[user.currTaskIndex].category.id == user.categoryList[index].id) {
//                                    user.indexCatList = index
//                                }
//                            }
//                        },
//                       label:{
//                        TaskCard(task: user.taskList[index])
//                            .ignoresSafeArea(.all)
//                       })
//                    Spacer()
//                } //foreach
//            }
//        } //vsatck
//        .navigationBarTitle("")
//        .navigationBarHidden(true)
//    } //navigation view
//        .onAppear{
//            user.taskList.append(Task(
//                name:"",
//                category:user.categoryList[0],
//                description:"",
//                difficulty: 1,
//                dueDate: Date(),
//                dateCompleted: Date(),
//                isOverdue: false ))
//            user.taskList.removeLast()
//            user.taskList = user.taskList.sorted(by: {
//                $0.dueDate.compare($1.dueDate) == .orderedAscending
//            })
//        }
//} //navigation
