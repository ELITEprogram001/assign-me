//
//  CalendarView.swift
//  AssignMe
//
//  Created by Santos, Alejandro on 11/3/21.
//

import SwiftUI

struct CalendarView: View {
    
    let data = (1...31).map { "\($0)" }
    var dueDateComponents = DateComponents()
    var userCalendar = Calendar(identifier: .gregorian)
    var dueDate: Date
    @State var date = Date()

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        VStack(){
            HStack {
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("<-")
                }
                .foregroundColor(.red)
                Spacer()
                Text("October").font(.custom("Avenir Next Demi Bold", size: 32, relativeTo: .title))
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("->")
                }
                .foregroundColor(.red)
                Spacer()
            }
            .padding(.top, 20.0)
            // end HStack
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(data, id: \.self) { item in
                        Cell(item)
                    }
                }
                .padding(.horizontal, 10) // Changes the padding on either side of the grid
            }
            .frame(maxHeight: 420)
            // end ScrollView
            
            VStack(spacing: 20){
                HStack {
                    Text("Tue, 21")
                        .bold()
                        .font(.title2)
                        .padding(.leading)
                    Spacer()
                }
                ScrollView {
                    LazyVStack(spacing: 20){
                        
                        let category = Category(name: "Mental Health", color: Color.pink)
                        let task = Task(name: "Dummy task", category: category, description: "Just some dummy task", difficulty: 2, dueDate: dueDate, dateCompleted: dueDate, isOverdue: false)
                        TaskCard(task: task)
                    }
                }
            }
            .background(Color.bg_dark.ignoresSafeArea())
            .foregroundColor(Color.white)
            // end VStack
        }
        .background(Color.bg_light.ignoresSafeArea())
        .foregroundColor(Color.white)
        // end VStack
    } // end body
    
    init(){
        dueDateComponents.month = 10
        dueDateComponents.day = 21
        dueDate = Calendar.current.date(from: dueDateComponents)!
    }
    
}

struct Cell: View {
    
    let day: String
    
    init(_ day: String){
        self.day = day
    }
    
    var body: some View {
        VStack(){
            Text(day)
        }
        .font(.custom("Avenir Next", size: 16, relativeTo: .body))
        .frame(maxHeight: 60)
        .frame(maxWidth: 60)
        .padding(.bottom, 45) // Modifies the padding of each cell bottom
        .padding(.horizontal, 5)
        .border(Color.gray, width: 1)
    }
}

extension Color {
    static let bg_dark = Color.init(red: 30/255, green: 30/255, blue: 30/255)
    static let bg_light = Color.init(red: 60/255, green: 60/255, blue: 60/255)
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
