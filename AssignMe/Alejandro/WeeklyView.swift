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
        ScrollView {
                VStack {
        ZStack {
            Color(red:0.150, green:0.150, blue:0.150 )
            .ignoresSafeArea()
                VStack(alignment:.leading) {
                    Text("\(user.taskList.count)")
                    ForEach(0..<user.taskList.count, id: \.self) { index in
                        TaskCard(task:user.taskList[index])
                    }
                
                }
      
            .padding(.leading,10)
        }
                }
        }
        .background(Color(red: 0.150, green: 0.150, blue: 0.150))

        }
            
        }
}

struct WeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyView()
    }
}

