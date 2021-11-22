//
//  SwiftUIView.swift
//  AssignMe
//
//  Created by Santos, Alejandro on 11/3/21.
//

import SwiftUI


var task: [Task] = TaskList.taskArray


struct WeeklyView: View {
    @EnvironmentObject var user: User
    @State var tabSelection: Int
    var body: some View {
        ZStack {
            NavigationView{
                VStack{
                    ForEach(0..<user.taskList.count, id: \.self) { index in
                        NavigationLink(destination: TaskDetailsView()
                                        .environmentObject(user)
                                        .navigationBarTitle("")
                                        .navigationBarHidden(true)
                                        .onAppear {
                            user.currTask = user.taskList[index]
                            user.currTaskIndex = index
                                                }, label:{
                            TaskCard(task: user.taskList[index])
                                .ignoresSafeArea(.all)
                        })
                    }
                }
            }
        }
        .onAppear{
            user.taskList.append(Task(name:"", category:user.categoryList[0], description:"", difficulty: 1, dueDate: Date(),  dateCompleted: Date(), isOverdue: false ))
            user.taskList.removeLast()
        }
    }
    
}

struct WeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyView(tabSelection: 1)
            .environmentObject(User.init(name: ""))
            .preferredColorScheme(.dark)
    }
}

