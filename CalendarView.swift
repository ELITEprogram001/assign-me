//
//  CalendarView.swift
//  AssignMe
//
//  Created by Santos, Alejandro on 11/3/21.
//

import SwiftUI

struct CalendarView: View {
    
    var dayCount: Int
    var dueDateComponents = DateComponents()
    var userCalendar = Calendar(identifier: .gregorian)
    var dueDate: Date
    @State var date = Date()
    @State var monthTitle = "October"
    @State var dayTitle = "Sunday"
    @State var numTitle = "1"
    private let dayLabels = [DayLabel("S"),DayLabel("M"),DayLabel("T"),DayLabel("W"),DayLabel("T"),DayLabel("F"),DayLabel("S")]
    private let monthNames = Calendar.current.monthSymbols
    //@Binding var lastSelectedCell: Cell

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
        
        VStack(spacing: 0){
            HStack {
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "arrow.left")
                }
                .foregroundColor(.red)
                Spacer()
                Text(monthNames[Calendar.current.component(.month, from: date) - 1])
                    .bold()
                    .font(.custom("Viga-Regular", size: 40, relativeTo: .title))
                Spacer()
                Button(action: getNextMonth) {
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.red)
                Spacer()
            }
            .padding(.bottom, 10)
            // end HStack
            
            
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(dayLabels) { item in
                    Text(item.label)
                        .foregroundColor(Color.red)
                }
                .font(.custom("Ubuntu-Bold", size: 18, relativeTo:.body))
                .padding(.bottom, 10)
                let offset = 0...Calendar.current.firstWeekday - 1
                ForEach(offset, id: \.self) {_ in
                    Spacer()
                }
                ForEach((1...getLastDay()), id: \.self) { day in
                    Cell(id: day, day.description)
                }
            }
            .padding(.horizontal, 30.0)
            .padding(.bottom)
            // end LazyVGrid
            Divider()
                .frame(height: 4)
                .background(Color.white)
            VStack(spacing: 10){
                HStack {
                    let numDay = Calendar.current.component(.day, from: date)
                    let suffix: String = getDaySuffix(numDay)
                    Text("\(dayTitle), \(numDay)\(suffix)")
                    Spacer()
                }
                .font(.custom("Viga-Regular", size: 28, relativeTo: .title2))
                .padding(.leading)
                .padding(.top, 10)
                ScrollView {
                    LazyVStack(spacing: 20){
                        // DUMMY DATA
                        let category = Category(name: "Mental Health", color: Color.blew)
                        let task = Task(name: "Dummy task", category: category, description: "Just some dummy task", difficulty: 2, dueDate: dueDate, dateCompleted: dueDate, isOverdue: false)
                        TaskCard(task: task)
                        // END DUMMY DATA
                    } // end LazyVStack
                } // end Scrollview
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
        dayCount = 0
    }
    
    func getNextMonth() {
        
    }
    
    func getLastDay() -> Int {
        let nextMonth = Calendar.current.date(byAdding: .month, value: 1, to: date)
        let lastDay = Calendar.current.date(byAdding: .day, value: -Calendar.current.component(.day, from: date), to: nextMonth ?? date)
        return Calendar.current.component(.day, from: lastDay!)
    }
    
    /**
     Returns either "st", "nd", or "th" based on the day's number.
     - Parameter day: The day in integer form
     - Returns: Either "st", "nd", or "th" based on the day's number
     */
    func getDaySuffix(_ day: Int) -> String {
        if(day == 1 || day == 21 || day == 31) {
            return "st"
        } else if(day == 2 || day == 22) {
            return "nd"
        } else {
            return "th"
        }
    }
    
}

struct Cell: View, Identifiable, Equatable {
    
    let day: String
    let id: Int
    @State var background = Color.white
    
    init(id: Int, _ day: String) {
        self.day = day
        self.id = id
    }
    
    var body: some View {
        VStack(spacing: 3){
            Text(day).bold()
                .foregroundColor(background)
            Divider()
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 1)
                .padding(.vertical, 0)
                .background(Color.gray)
            Spacer()
        }
        .font(.custom("Ubuntu-Regular", size: 16, relativeTo: .body))
        .frame(minHeight: 60, maxHeight: 100)
        .contentShape(Rectangle())
        .onTapGesture {
            background = Color.red
        }
    }
    
    static func == (lhs: Cell, rhs: Cell) -> Bool {
        return lhs.day == rhs.day
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
    static let blew = Color.init(red: 131/255, green: 201/255, blue: 244/255)
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
