//
//  SwiftUIView.swift
//  AssignMe
//
//  Created by Santos, Alejandro on 11/3/21.
//

import SwiftUI


var task: [Task] = TaskList.taskArray


struct WeeklyView: View {
    @State var showMenu = false //to determine if the showMenu is true then the  MenuView show on top of MainView by using ZStack
    
    @EnvironmentObject var user: User
    @State var tabSelection: Int
    @State var myDictionaryDateToInt:[String:Int] = [:]
    @State var myDictionaryIntToDate:[Int:String] = [:]
    @State var myDictionaryNext6Days:[String:Int] = [:]
    @State var formatterDMY = DateFormatter()
    var body: some View {
    
        
        
        let drag = DragGesture()// this to close the Side MEnu by dragging from right to left
            .onEnded{
                if $0.translation.width < -100{ //if pixel less then -100 ??
                    withAnimation{
                        self.showMenu = false
                    }
                }
            } //onEnded

        return NavigationView{
            ZStack{ Color(red: 0.150, green: 0.150, blue:0.150).edgesIgnoringSafeArea(.all)
                GeometryReader { geometry in
                    
//                    Text("Filter by:  \(filter.selected) ")
//                        .padding(.leading, 200)
                        
                    Button(action: {    // Hamburger Menu
                        withAnimation{
                            self.showMenu.toggle()
                        }
                    }, label: {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .frame(width: 30 ,height: 30)
                    })
                    .padding(.leading, 320)
                    
                    ScrollView{
					
                        ForEach(1..<user.taskList.count, id: \.self) { index in
                            if (myDictionaryNext6Days[formatterDMY.string(from: user.taskList[index].dueDate )] == 1 && myDictionaryIntToDate[index] != nil){
                                Text("\(myDictionaryIntToDate[index]!)")
                                    .bold()
                                    .font(.custom("Viga-Regular", size: 28))
                                    .padding(.trailing,200)
                                    .padding(.top,20)
                                    
                            }
                            if(myDictionaryNext6Days[formatterDMY.string(from: user.taskList[index].dueDate )] == 1)
                            {
                            NavigationLink(destination: TaskDetailsView(task: user.taskList[index] )

                                .environmentObject(user)
                                .onAppear {
                                    user.currTask = user.taskList[index]
                                    user.currTaskIndex = index
                                    for index in 0..<user.categoryList.count{
                                        if (user.taskList[user.currTaskIndex].category.id == user.categoryList[index].id) {
                                            user.indexCatList = index
                                        }
                                    }
                                },
                               label:{
                                TaskCard(task: user.taskList[index])
                                    .ignoresSafeArea(.all)
                               })
                            }
                            Spacer()
                            
                        } //foreach
 
                    } //scroll view
                    .padding(.top, 30)
                        .gesture(drag)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: self.showMenu ? geometry.size.width/2.5 : 0)   //this to push the MainView to the right
                        .disabled(self.showMenu ? true : false)
                    
                    if self.showMenu{
                        FilterMenu()
                            .frame(width: geometry.size.width/2.5)
                            .transition(.move(edge: .leading))
                    } //if
                } //geometry reader
                .navigationBarTitle("")
                .navigationBarHidden(true)
                
                
                
            } //ZStack
            
            .onAppear{
                user.taskList.append(Task(
                    name:"",
                    category:user.categoryList[0],
                    description:"",
                    difficulty: 1,
                    dueDate: Date(),
                    dateCompleted: Date()))
                user.taskList.removeLast()
                user.taskList = user.taskList.sorted(by: {
                    $0.dueDate.compare($1.dueDate) == .orderedAscending
                })
                let formatter = DateFormatter()
                let formatter2 = DateFormatter()
                formatter.dateFormat = "M - dd - yyyy"
                formatter2.dateFormat = "EE, MMM dd"
                for count in 1...user.taskList.count {
                    if (count<user.taskList.count)
                    {
                        formatter.string(from:user.taskList[count].dueDate)
                        if(myDictionaryDateToInt[formatter.string(from:user.taskList[count].dueDate)] == nil)
                        {
                            myDictionaryIntToDate[count] = formatter2.string(from:user.taskList[count].dueDate)
                        }
                        myDictionaryDateToInt[formatter.string(from:user.taskList[count].dueDate)] = 1
                        
                        //myDictionaryIntToDate[count] = formatter.string(from:user.taskList[count].dueDate)
                        //print(user.taskList[count].dueDate)
                    }
                }
                let date = Date()
                formatterDMY.timeZone = .current
                formatterDMY.locale = .current
                formatterDMY.dateFormat = "M - dd - yyyy"
                for n in 0...6
                {
                    let modifiedDate = Calendar.current.date(byAdding: .day, value: n, to: date)
                    myDictionaryNext6Days[formatterDMY.string(from: modifiedDate ?? Date())] = 1
                }
            }
        } //navigation View
        
        
    }//body
    
} //weeklyview


struct MainView : View{
    @Binding var showMenu: Bool
    var body: some View{
            Text("")
    }
}


struct WeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyView(tabSelection: 1)
            .environmentObject(User.init(name: ""))
            .preferredColorScheme(.dark)
    }
}

//################################################# original code

//NavigationView{
//    ZStack{
//        Color(red: 0.150, green: 0.150, blue:0.150).edgesIgnoringSafeArea(.all)
//        VStack{
//            ScrollView{
//                ForEach(1..<user.taskList.count, id: \.self) { index in
//                    NavigationLink(destination: TaskDetailsView(task: user.taskList[index] )
//                        .environmentObject(user)
//                        .onAppear {
//                            user.currTask = user.taskList[index]
//                            user.currTaskIndex = index
//                            for index in 0..<user.categoryList.count{
//                                if (user.taskList[user.currTaskIndex].category.id == user.categoryList[index].id) {
//                                    user.indexCatList = index
//                                }
//                            }
//                        },
//                       label:{
//                        TaskCard(task: user.taskList[index])
//                            .ignoresSafeArea(.all)
//                       })
//                    Spacer()
//                } //foreach
//            }
//        } //vsatck
//        .navigationBarTitle("")
//        .navigationBarHidden(true)
//    } //navigation view
//        .onAppear{
//            user.taskList.append(Task(
//                name:"",
//                category:user.categoryList[0],
//                description:"",
//                difficulty: 1,
//                dueDate: Date(),
//                dateCompleted: Date(),
//                isOverdue: false ))
//            user.taskList.removeLast()
//            user.taskList = user.taskList.sorted(by: {
//                $0.dueDate.compare($1.dueDate) == .orderedAscending
//            })
//        }
//} //navigation
