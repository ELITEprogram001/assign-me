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
//
//
//
//            } //scroll view ?
//            .background(Color(red: 0.150, green: 0.150, blue: 0.150))
//################################################################################
            NavigationView{
                //Text("plz work")
                List(task){ Task in
                    NavigationLink(destination: ActualTaskDetailView(task: Task), label:{
                        ZStack{
                            Color(red: 0.133, green: 0.133, blue: 0.133).edgesIgnoringSafeArea(.all)
                            HStack(spacing: -4){ //attributes for the category colour tab to the left
                                Rectangle() //Left-hand category colour tab
                                    .foregroundColor(.red)
                                    .frame(width: 15.0, height: 87)
                                    .cornerRadius(5)
                                Rectangle() //Card Body
                                    .fill(Color (red: 0.35, green: 0.35, blue: 0.35))
                                    .frame(width: 380, height: 87)
                                    .shadow(radius: 6) //optional
                                    .cornerRadius(5)
                                
                            } //hstack for the taskcard
                            VStack(alignment: .leading){
                                Text(Task.name)    //title
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                    .lineLimit(1)       //this limit the line that will display the rest will be "..."
                                    .minimumScaleFactor(0.5)    //this allow the text to shrink when alot of text is added.
                                
                                HStack{
                                    Text("Due: ")
    //                                Text("\(task.dueDate)" ) //uploaddate
    //                                    .font(.subheadline) //change type of
    //                                    .foregroundColor(.red)
                                    Text("Due: \(Task.dueDate)")
                                        .font(.subheadline) //change type of
                                        .foregroundColor(.red)
                                } //hstack
                                Text(task.description)
                                    .foregroundColor(.gray)
                            } //vstack
                            .navigationBarHidden(true)
                        }   //zstack
                    }) // link/label
                }
                //.ignoresSafeArea()
            } //navigation view
            //.ignoresSafeArea()
            
//#############################################################################################
        } //zstack
        
    } //body
} //weekly view

struct WeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyView().environmentObject(User.init(name: ""))
    }
}

