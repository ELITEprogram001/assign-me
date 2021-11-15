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
    var body: some View {
     
        
        ZStack {
            Color(red: 0.150, green: 0.150, blue:0.150).edgesIgnoringSafeArea(.all)
//#############################################################
//            ScrollView {
//                    VStack(alignment:.leading) {
//                        Text("\(user.taskList.count)")
//                        ForEach(0..<user.taskList.count, id: \.self) { index in
//                                TaskCard(task:user.taskList[index])
//                        }
//
//                    } //vstack
//                    .padding(.leading,10)
//            } //scroll view ?
//            .background(Color(red: 0.150, green: 0.150, blue: 0.150))
//################################################################################
        NavigationView{
            List(task){ Task in
                NavigationLink(destination: ActualTaskDetailView(task: Task), label:{
                    //ZStack{ //zstack 2
                        Color(red: 0.133, green: 0.133, blue: 0.133).edgesIgnoringSafeArea(.all)
                        
                        TaskCard(task: Task)
    
                    //}   //zstack 2
                    .ignoresSafeArea(.all)
                }) // navigation link/label
                //.ignoresSafeArea(.all)
                VStack{
                    ForEach(0..<user.taskList.count, id: \.self) { index in
                        TaskCard(task: user.taskList[index])
                    }
                }
            } //list
        } //navigation view
//        .navigationBarHidden(true)
//        .ignoresSafeArea(.all)

            
            
        } //zstack
//        .navigationBarHidden(true)

        

//#############################################################################################
        
        
    } //body
    
} //weekly view

struct WeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyView()
            .environmentObject(User.init(name: ""))
            .preferredColorScheme(.dark)
    }
}

