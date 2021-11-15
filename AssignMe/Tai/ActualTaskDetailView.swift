//
//  ActualTaskDetailView.swift
//  AssignMe
//
//  Created by Tran, Tai Vinh on 11/14/21.
//

import SwiftUI

struct ActualTaskDetailView: View {
    
    var task: Task
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            Color(red: 0.150, green: 0.150, blue:0.150).edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 40){
                
                HStack(){
                    Spacer()
                    Text("Task Detail")
                        .font(.system(size: 25, weight: .bold, design: .serif))
                        .padding(.horizontal,45)
                        .foregroundColor(.white)
                    Button(action:{
                        isActive = true
                    },label:{
                        
                        Image(systemName: "square.and.pencil")
                        .frame(width: 60, height: 40)
                    })  //button
                    //.frame(width: 60, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    NavigationLink(destination: TaskDetailsView(task: task), isActive: $isActive) { } //navigationLink
                } //hstack
                
        
                
                VStack(alignment: .leading, spacing: 25){
                    Text("Task Name:")
                        .foregroundColor(.blue)
                    
                    Text(task.name)
                        .font(.title)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .multilineTextAlignment(.center) //to alight to center
                        .padding(.horizontal)
                    Text("Description:")
                        .foregroundColor(.blue)
                    Text(task.description)
                        .lineLimit(2)
                        .multilineTextAlignment(.center) //to alight to center
                        .padding(.horizontal)
                    Text("Due Date:")
                        .foregroundColor(.blue)
                    Text("\(task.dueDate)")
                        .lineLimit(2)
                        .multilineTextAlignment(.center) //to alight to center
                        .padding(.horizontal)
                    Text("Difficulty:")
                        .foregroundColor(.blue)
                    
                    HStack( spacing: 1){
                        let starCount = task.difficulty
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
                    Text("Over Due ?:")
                        .foregroundColor(.blue)
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
            //.ignoresSafeArea()
        }//Zstack
       //.ignoresSafeArea(.all)
    }
}

struct ActualTaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //ActualTaskDetailView(task: TaskList.allTask.first!).preferredColorScheme(.dark)
        ActualTaskDetailView(task: TaskList.taskArray.first!).preferredColorScheme(.dark)
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
