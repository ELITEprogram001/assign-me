//
//  ActualTaskDetailView.swift
//  AssignMe
//
//  Created by Tran, Tai Vinh on 11/14/21.
//

import SwiftUI

struct ActualTaskDetailView: View {
    var body: some View {
        ZStack {
            Color(red: 0.150, green: 0.150, blue:0.150).edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 40){
                
                HStack(){
                    Spacer()
                    Text("Category Edit")
                        .font(.system(size: 25, weight: .bold, design: .serif))
                        .padding(.horizontal,20)
                        .foregroundColor(.white)
                    Button(action:{   }, label:{ Image(systemName: "square.and.pencil")
//                        let toAdd = Task(
//                            name:taskName,
//                            category: user.categoryList[0],
//                            description:taskDesc,
//                            difficulty:difficulty,
//                            dueDate:dueDate,
//                            dateCompleted:dueDate,
//                            isOverdue:false)
//                        user.taskList.append(toAdd)
                    })  //button
                    .frame(width: 60, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                } //hstack
                
                Text("Task Details") //title
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .multilineTextAlignment(.center) //to alight to center
                    .padding(.horizontal)
                
                //VStack(alignment: .leading, spacing: 40){
                Text("Task Name:")
                    .foregroundColor(.blue)
                
                Text("Description:")
                    .foregroundColor(.blue)
                Text("Due Date:")
                    .foregroundColor(.blue)
                Text("Difficulty:")
                    .foregroundColor(.blue)
                
                Text("Category:")
                    .foregroundColor(.blue)
                //}//vstack
                
                Spacer()
                
                
                
            } //vstack
            .frame(width: 360)
        }//Zstack
    }
}

struct ActualTaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActualTaskDetailView().preferredColorScheme(.dark)
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
