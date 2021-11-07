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
    @State var monthTitle = "October"
    private let dayLabels = [DayLabel("S"),DayLabel("M"),DayLabel("T"),DayLabel("W"),DayLabel("T"),DayLabel("F"),DayLabel("S")]
    private let monthNames = Calendar.current.monthSymbols

    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
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
                Text(monthNames[Calendar.current.component(.month, from: date) - 1])
                    .bold()
                    .font(.custom("Viga-Regular", size: 40, relativeTo: .title))
                Spacer()
                Button(action: getNextMonth) {
                    Text("->")
                }
                .foregroundColor(.red)
                Spacer()
            }
            .padding(.bottom, 0)
            // end HStack
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(dayLabels) { item in
                        Text(item.label)
                    }
                    .font(.custom("Ubuntu-Bold", size: 16, relativeTo:.body))
                    .padding(.bottom, 10)
                    ForEach(data, id: \.self) { item in
                        Cell(id: Int(item) ?? 0, item)
                    }
                }
                .padding(.horizontal, 20) // Changes the padding on either side of the grid
            }
            .frame(maxHeight: 420)
            // end ScrollView
            
            VStack(spacing: 20){
                HStack {
                    Text("Tue, 21")
                        .bold()
                        .font(.custom("Viga-Regular", size: 24, relativeTo: .title2))
                        .padding(.leading)
                        .padding(.top, 20)
                    Spacer()
                }
                ScrollView {
                    LazyVStack(spacing: 20){
                        // DUMMY DATA
                        let category = Category(name: "Mental Health", color: Color.pink)
                        let task = Task(name: "Dummy task", category: category, description: "Just some dummy task", difficulty: 2, dueDate: dueDate, dateCompleted: dueDate, isOverdue: false)
                        TaskCard(task: task)
                        // END DUMMY DATA
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
    
    // Init for creating dummy data
    init(){
        dueDateComponents.month = 10
        dueDateComponents.day = 21
        dueDate = Calendar.current.date(from: dueDateComponents)!
        
        // Get Current Month
    }
    
    func getNextMonth() {
        
    }
    
}

struct Cell: View, Identifiable {
    
    let day: String
    let id: Int
    
    init(id: Int, _ day: String) {
        self.day = day
        self.id = id
    }
    
    var body: some View {
        VStack(){
            Text(day)
        }
        .font(.custom("Ubuntu-Regular", size: 16, relativeTo: .body))
        .frame(maxHeight: 60)
        .frame(maxWidth: 60)
        .padding(.bottom, 45) // Modifies the padding of each cell bottom
        .padding(.horizontal, 5)
        .border(Color.gray, width: 1)
    }
    
    func selectDay() {
        
    }
}

private struct DayLabel: Identifiable {
    var id = UUID()
    let label: String
    
    init(_ label: String) {
        self.label = label
    }
}

extension Color {
    static let bg_dark = Color.init(red: 30/255, green: 30/255, blue: 30/255)
    static let bg_light = Color.init(red: 45/255, green: 45/255, blue: 45/255)
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
