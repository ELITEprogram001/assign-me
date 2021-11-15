//
//  SwiftUIView.swift
//  AssignMe
//
//  Created by Santos, Alejandro on 11/3/21.
//

import SwiftUI

struct WeeklyView: View {
    @EnvironmentObject var user: User
    var body: some View {
        ZStack {
            Color(red: 0.150, green: 0.150, blue:0.150).edgesIgnoringSafeArea(.all)
            
//            ScrollView {
//                    VStack(alignment:.leading) {
//                        Text("\(user.taskList.count)")
//                        ForEach(0..<user.taskList.count, id: \.self) { index in
// //                           NavigationLink(destination: ActualTaskDetailView() ){
//                                TaskCard(task:user.taskList[index])
////                            } //navigation link
//                        }
//
//                    } //vstack
//                    .padding(.leading,10)
//
//
//
//            } //scroll view ?
//            .background(Color(red: 0.150, green: 0.150, blue: 0.150))
//################################################################################
            NavigationView{
                Text("\(user.taskList.count)")
                List(0..<user.taskList.count, id: \.self) index in{
                    TaskCard(task:user.taskList[index])
                }
                
                //.ignoresSafeArea()
                
                
            } //navigation
            //.ignoresSafeArea()
            
//#############################################################################################
        } //zstack
        
    } //body
} //weekly view

struct WeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyView().environmentObject(User.init(name: "helo"))
    }
}

