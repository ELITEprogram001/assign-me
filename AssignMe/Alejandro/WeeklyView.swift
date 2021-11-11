//
//  SwiftUIView.swift
//  AssignMe
//
//  Created by Santos, Alejandro on 11/3/21.
//

import SwiftUI

struct WeeklyView: View {

    
//tbd tbdx2
    @EnvironmentObject var user: User
    @State var arrString = [String]()
    var dateArray = [Date]()
    var stringArray = [String]()
    var taskList = [Task]()
 // sets the dates for the task cards and the current days of the week.
    init() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let testDate = formatter.date(from: "2016/10/08 22:31")!
        let Mental_Health = Category(name:"Mental Health",color:Color.red)
        let testObj = Task(name: "push ups", category: Mental_Health, description: "I will do 100 push ups!", difficulty: 5, dueDate: testDate,dateCompleted: Date(), isOverdue: true)
        taskList.append(testObj)
//The following lines of code set the title days
        let date = Date()
        for n in 0...6
        {
        let modifiedDate = Calendar.current.date(byAdding: .day, value: n, to: date)!
        dateArray.append(modifiedDate)
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = /*"MMM/dd/yyyy"*/  "E, MMM d"
        stringArray.append( formatter.string(from: modifiedDate))
        }

    }
    var body: some View {
        ZStack {
            Color(red: 0.150, green: 0.150, blue:0.150).edgesIgnoringSafeArea(.all)
            
            
        ScrollView {
                VStack {
                 
                    
                //}
            //}
    
        ZStack {
            Color(red:0.150, green:0.150, blue:0.150 )
            .ignoresSafeArea()
           // HStack {
                //displays the tasks (test)
                VStack(alignment:.leading) {
                    Text("\(user.taskList.count)")
                    ForEach(0..<user.taskList.count, id: \.self) { index in
                        TaskCard(task:user.taskList[index])
 /*                       Text("\(user.taskList[index].name)")
                          .font(.system(size: 40  ))
                            .foregroundColor(Color.white)/*.padding(.leading, 0.0)*/
  */
                        //.padding(.leading,170)
                    }
                    // WEEKLY VIEW DISPLAY
                        ForEach(0..<stringArray.count, id: \.self ) { index in
                            Text(stringArray[index])
                              .font(.system(size: 40  ))
                                .foregroundColor(Color.white)
                            /*.padding(.leading, 0.0)*/
                            HStack{
                                TaskCard(task: taskList[0])
                            }
                            //.padding(.leading,170)
                        }
                }
            //.padding(.init(top: 0, leading: 20, bottom: 400, trailing: 20))
       // }
            .padding(.leading,10)// vstack padding for date and task cards
        }
                }
        }
        .background(Color(red: 0.150, green: 0.150, blue: 0.150))

        }.onAppear(){
            
        }
}
}
struct WeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyView()
    }
}

