//
//  SwiftUIView.swift
//  AssignMe
//
//  Created by Santos, Alejandro on 11/3/21.
//

import SwiftUI

struct WeeklyView: View {

    
//tbd tbdx2
    var dateArray = [Date]()
    var stringArray = [String]()
    var taskList = [Task]()
    var myViews = [AnyView]()
    var fitness = Category (name: "Health", color: .green)
    
    mutating func populateTasks(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let testDate = formatter.date(from: "2021/11/05 22:13")!
        let testDate1 = formatter.date(from: "2021/11/04 22:13")!
        let testDate2 = formatter.date(from: "2021/11/03 22:13")!
        let testObj = Task(name: "push ups", category:fitness, description: "I will do 100 push ups!", difficulty: 5, dueDate: testDate,dateCompleted: Date(), isOverdue: true)
        let testObj1 = Task(name: "push ups", category:fitness, description: "I will do 100 push ups!", difficulty: 5, dueDate: testDate1,dateCompleted: Date(), isOverdue: true)
        let testObj2 = Task(name: "push ups", category:fitness, description: "I will do 100 push ups!", difficulty: 5, dueDate: testDate2,dateCompleted: Date(), isOverdue: true)
        
        taskList.append(testObj)
        taskList.append(testObj1)
        taskList.append(testObj2)
       
    }
    
 // sets the dates for the task cards and the current days of the week.
    init() {

        populateTasks()
        myViews.append(AnyView(Text("Test Text Display")))
        myViews.append(AnyView(TaskCard(task: taskList[0])))
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let testDate = formatter.date(from: "2016/10/08 22:31")!
        let testObj = Task(name: "push ups", category:fitness, description: "I will do 100 push ups!", difficulty: 5, dueDate: testDate,dateCompleted: Date(), isOverdue: true)
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
                //displays the date between task cards
                VStack(alignment:.leading) {
                        AnyView(myViews[0])
                        AnyView(myViews[1])

                        ForEach(0..<stringArray.count) { index in
                            Text(stringArray[index])
                              .font(.system(size: 40  ))
                                .foregroundColor(Color.white) /*.padding(.leading, 0.0)*/
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

    }
}
}
struct WeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyView()
    }
}

