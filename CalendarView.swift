//
//  CalendarView.swift
//  AssignMe
//
//  Created by Santos, Alejandro on 11/3/21.
//

import SwiftUI

struct CalendarView: View {
    
    var userCalendar = Calendar(identifier: .gregorian)
    @State var date = Date()
    @State var monthTitle = "Error"
    @State var dayTitle: String
    @State var numTitle: Int
    @State var suffix: String
    private let dayLabels = [DayLabel("S"),DayLabel("M"),DayLabel("T"),DayLabel("W"),DayLabel("T"),DayLabel("F"),DayLabel("S")]
    private var shift = Offsets()
    @State var lastSelectedCell = Cell(id: "9999-99-99", "99", date: Date())
    @State var selectedCell: Cell
    //Cell(id: "6666-66-66", "66", date: Date())
    @ObservedObject var cellState = CellState()
    var calendar: [[[Cell]]]

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
                Button(action: {
                    getNextMonth(value: -1)
                }) {
                    Image(systemName: "arrow.left")
                }
                .foregroundColor(.red)
                Spacer()
                Text(getMonthTitle(d: date))
                    .bold()
                    .font(.custom("Viga-Regular", size: 40, relativeTo: .title))
                Spacer()
                Button(action: {
                    getNextMonth(value: 1)
                }) {
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
                // add spacers to the view to shift the first week
                ForEach(getOffset()) { _ in
                    VStack {
                        Divider()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 0)
                            .background(Color.gray)
                        Spacer()
                    }
                }
                // Call a method to calculate what the current month is and return all the cells
                ForEach(getMonthCells(d: date) ?? calendar[0][0]) { cell in
                    cell
                        .onTapGesture {
                            // Update lastSelectedCell and make it white
                            lastSelectedCell = selectedCell
                            lastSelectedCell.updateState(selected: false)

                            // Update selected cell and highlight it red
                            selectedCell = cell
                            selectedCell.updateState(selected: true)
                            print("[SELECT] cell: \(cell.id)\tselected: \(cell.cellState.selected)")
                            print("[DEBUG] selectedCell: \(selectedCell)")

                            updateDailyViewTitle(d: selectedCell.date)
                        }
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
                    DailyViewTitle(dayTitle: $dayTitle, numTitle: $numTitle, suffix: $suffix)
                    // I don't understand why the above code works and the below code doesn't
                    //Text("\(dayTitle), \(numTitle)\(suffix)")
                    Spacer()
                }
                .font(.custom("Viga-Regular", size: 28, relativeTo: .title2))
                .padding(.leading)
                .padding(.top, 10)
                ScrollView {
                    LazyVStack(spacing: 0){
                        // TODO: Add filter to only show the current day
                        debugTaskCard(name: "Take Out Trash", desc: "Take out kitchen and bathroom trash", dif: 1, dueM: 11, dueD: 9)
                        debugTaskCard(name: "Run 2 Miles", desc: "Training for a 5k", dif: 3, dueM: 11, dueD: 9)
                        debugTaskCard(name: "Create an App", desc: "Learn Swift and make a functional app :/", dif: 5, dueM: 12, dueD: 9)
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
    
    init() {
        print("[INIT] start")
        calendar = [[[Cell]]]()
        _selectedCell = State(initialValue: Cell(id: "6666-66-66", "66", date: Date()))
        _dayTitle = State(initialValue: "Error")
        _numTitle = State(initialValue: 99)
        _suffix = State(initialValue: "th")
        
        // Goal is to create cells for each month of the previous, current, and next year on initialization and add more if the user navigates further
        for yearOffset in -1...1 {
            let yearDate = Calendar.current.date(byAdding: .year, value: yearOffset, to: Date())
            var yearArr = [[Cell]]()
            for month in 1...12 {
                var comp = Calendar.current.dateComponents([.year, .month, .day], from: yearDate ?? Date())
                comp.month = month
                let yearAndMonth = Calendar.current.date(from: comp)
                var currentMonth = [Cell]()
                for day in 1...getLastDay(month: yearAndMonth ?? Date()) {
                    comp.day = day
                    let completeDate = Calendar.current.date(from: comp)
                    let year = comp.year!
                    let month = comp.month!
                    let id = year.description + "-" + month.description + "-" + day.description
                    let cell = Cell(id: id, day.description, date: completeDate ?? Date())
                    let DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: Date())
                    let yearNow = DateComponents.year!
                    let monthNow = DateComponents.month!
                    let dayNow = DateComponents.day!
                    if((year == yearNow) && (month == monthNow) && (day == dayNow)) {
                        print("[INFO] initial selected cell \(year)-\(month)-\(day)")
                        cell.updateState(selected: true)
                        lastSelectedCell = cell
                        _selectedCell = State(initialValue: cell)
                        print("[DEBUG] selectedCell: \(selectedCell)")
                        print("[DEBUG] cell: \(cell)")
                    }
                    currentMonth.append(cell)
                }
                yearArr.append(currentMonth)
            }
            calendar.append(yearArr)
        }
        
        // Update the initial value of the Daily View title
        _dayTitle = State(initialValue: Calendar.current.weekdaySymbols[Calendar.current.component(.weekday, from: selectedCell.date) - 1])
        _numTitle = State(initialValue: Calendar.current.component(.day, from: selectedCell.date))
        _suffix = State(initialValue: getDaySuffix(Calendar.current.component(.day, from: selectedCell.date)))
        
        print("[INIT] end")
    }
    
    func getMonthCells(d: Date) -> [Cell]? {
        let year = Calendar.current.component(.year, from: d)
        let month = Calendar.current.component(.month, from: d)
        //print("[INFO] looking for \(year)-\(month)")
        for yearArr in calendar {
            //print("[INFO] found year: \(Calendar.current.component(.year, from: yearArr[0][0].date))")
            if (Calendar.current.component(.year, from: yearArr[0][0].date) == year) {
                for monthArr in yearArr {
                    //print("[INFO] found month: \(Calendar.current.component(.month, from: monthArr[0].date))")
                    if (Calendar.current.component(.month, from: monthArr[0].date) == month) {
//                        print("================= Gathered Month Array =================")
//                        for cell in monthArr {
//                            print("cell: \(cell.id)\tselected: \(cell.cellState.selected)")
//                        }
//                        print("=================== End Month Array ====================")
                        return monthArr
                    }
                }
            }
        }
        print("[ERROR] couldn't find the month \(Calendar.current.monthSymbols[Calendar.current.component(.month, from: d)])")
        return nil
    }
    
    func getOffset() -> [EmptyCell] {
        shift.offsets.removeAll()
        let firstWeekday = getFirstWeekdayOfMonth(d: date)
        print("[DEBUG] first weekday is: \(firstWeekday)")
        if(firstWeekday > 1) {
            for _ in 1...(firstWeekday - 1) {
                shift.offsets.append(EmptyCell())
            }
        }
        return shift.offsets
    }
    
    func getFirstWeekdayOfMonth(d: Date) -> Int{
        var comp = Calendar.current.dateComponents([.year, .month, .day, .weekday], from: d)
        comp.day = 1
        let firstDay = Calendar.current.date(from: comp)
        return Calendar.current.component(.weekday, from: firstDay ?? Date())
    }
    
    func updateDailyViewTitle(d: Date) {
        dayTitle = Calendar.current.weekdaySymbols[(Calendar.current.component(.weekday, from: d)) - 1]
        numTitle = Calendar.current.component(.day, from: d)
        suffix = getDaySuffix(numTitle)
    }
    
    func getMonthTitle(d: Date) -> String {
        return Calendar.current.monthSymbols[(Calendar.current.component(.month, from: d)) - 1]
    }
    
    func debugTaskCard(name: String, desc: String, dif: Int, dueM: Int, dueD: Int) -> some View {
        var dueDateComponents = DateComponents()
        var dueDate: Date
        dueDateComponents.month = dueM
        dueDateComponents.day = dueD
        dueDate = Calendar.current.date(from: dueDateComponents)!
        let category = Category(name: "Uncategorized", color: Color.blew)
        let task = Task(name: name, category: category, description: desc, difficulty: dif, dueDate: dueDate, dateCompleted: dueDate, isOverdue: false)
        return TaskCard(task: task)
    }
    
    func getNextMonth(value: Int) {
        date = Calendar.current.date(byAdding: .month, value: value, to: date) ?? Date()
    }
    
    // Get the last day given a date with the selected month
    func getLastDay(month: Date) -> Int {
        let nextMonthDate = Calendar.current.date(byAdding: .month, value: 1, to: month)
        var monthComp = Calendar.current.dateComponents([.year, .month, .day], from: nextMonthDate ?? Date())
        monthComp.day = 1
        let nextMonth = Calendar.current.date(from: monthComp)
        let lastDay = Calendar.current.date(byAdding: .day, value: -1, to: nextMonth ?? Date())
        return Calendar.current.component(.day, from: lastDay ?? Date())
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
        } else if (day == 3 || day == 23) {
            return "rd"
        } else {
            return "th"
        }
    }
    
}

struct DailyViewTitle: View {
    @Binding var dayTitle: String
    @Binding var numTitle: Int
    @Binding var suffix: String
    
    var body: some View {
        Text("\(dayTitle), \(numTitle)\(suffix)")
    }
}

struct Cell: View, Identifiable, Equatable{
    
    let day: String
    let id: String
    let date: Date
    @ObservedObject var cellState: CellState
    
    init(id: String, _ day: String, date: Date) {
        self.day = day
        self.id = id
        self.date = date
        self.cellState = CellState()
    }
    
    var body: some View {
        VStack(spacing: 3){
            Divider()
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 1)
                .padding(.vertical, 0)
                .background(Color.gray)
            Text(day).bold()
                .foregroundColor(cellState.color)
            Spacer()
        }
        .font(.custom("Ubuntu-Regular", size: 16, relativeTo: .body))
        .frame(minHeight: 60, maxHeight: 100)
        .contentShape(Rectangle())
    }
    
    func updateState (selected: Bool) {
        self.cellState.selected = selected
        if(selected) {
            self.cellState.color = Color.red
        } else {
            self.cellState.color = Color.white
        }
    }
    
    static func == (lhs: Cell, rhs: Cell) -> Bool {
        let lhsComp = Calendar.current.dateComponents([.day, .month, .year], from: lhs.date)
        let rhsComp = Calendar.current.dateComponents([.day, .month, .year], from: rhs.date)
        return (lhsComp.day == rhsComp.day) && (lhsComp.month == rhsComp.month) && (lhsComp.year == rhsComp.year)
    }
}

class CellState: ObservableObject {
    @Published var color = Color.white
    @Published var selected = false
}

private struct DayLabel: Identifiable {
    var id = UUID()
    let label: String
    
    init(_ label: String) {
        self.label = label
    }
}

struct EmptyCell: Identifiable, Hashable {
    var id = UUID()
}

extension Color {
    static let bg_dark = Color.init(red: 30/255, green: 30/255, blue: 30/255)
    static let bg_light = Color.init(red: 45/255, green: 45/255, blue: 45/255)
    static let blew = Color.init(red: 131/255, green: 201/255, blue: 244/255)
    static let near_black = Color.init(red: 10/255, green: 10/255, blue: 10/255)
}

class Offsets {
    var offsets: [EmptyCell]
    
    init() {
        offsets = []
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
