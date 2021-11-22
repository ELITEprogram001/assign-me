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
                    ScrollView{
                        ForEach(0..<user.taskList.count, id: \.self) { index in
                            //Color(.red)   //for debuing
                            NavigationLink(destination: TaskDetailsView()
                                .environmentObject(user)
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                                .onAppear {
                                    user.currTask = user.taskList[index]
                                    user.currTaskIndex = index
                                }, label:{
                                    //Color(.blue)      //for debug
                                    TaskCard(task: user.taskList[index])
                                    //Color(.green).ignoresSafeArea(.all)       //for debug
                                }) //navigationLInk
                            //.ignoresSafeArea(.all)
                            //Color(.yellow)    //for debug
                            Spacer()
                            
                        } //foreach
                    }
                } //vstack
                        //these delete the top portion
                .navigationBarTitle("")
                .navigationBarHidden(true)
            } //navigation View
            
        } //zstack
    }
    
}

struct WeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyView(tabSelection: 1)
            .environmentObject(User.init(name: ""))
            .preferredColorScheme(.dark)
    }
}

