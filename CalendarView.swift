//
//  CalendarView.swift
//  AssignMe
//
//  Created by Santos, Alejandro on 11/3/21.
//

import SwiftUI


struct CalendarView: View {
    
    // MARK: Struct Variables
    var userCalendar = Calendar(identifier: .gregorian)
    @State var date = Date()
    @State var monthTitle = "Error"
    @State var dayTitle: String
    @State var numTitle: Int
    @State var suffix: String
    private let dayLabels = [DayLabel("S"),DayLabel("M"),DayLabel("T"),DayLabel("W"),DayLabel("T"),DayLabel("F"),DayLabel("S")]
    private var shift = Offsets()
    private var calendar: Calendar = Calendar.current
    @State var lastSelectedCell = Cell(id: "9999-99-99", "99", date: Date())
    @State var selectedCell: Cell
    @ObservedObject var cellState = CellState()
    var allCells: [[[Cell]]]
    var allDays: [[Cell]]
    @EnvironmentObject var user: UserOld
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
      entity: TaskEntity.entity(),
      sortDescriptors: [NSSortDescriptor(keyPath: \TaskEntity.dueDate, ascending: true)]
    ) var tasks: FetchedResults<TaskEntity>

    // MARK: Grid Definitions
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
            
            // MARK: Top Bar
            HStack {
                Spacer()
                Button(action: {
                    getNextMonth(value: -1)
                }) {
                    Image(systemName: "arrow.left")
                }
                .foregroundColor(.bright_maroon)
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
                .foregroundColor(.bright_maroon)
                Spacer()
            }
            .padding(.bottom, 10)
            // end HStack
            
            // MARK: Calendar Creation
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(dayLabels) { item in
                    Text(item.label)
                        .foregroundColor(Color.bright_maroon)
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
                ForEach(getMonthCells(d: date) ?? allCells[0][0]) { cell in
                    cell
                        .onTapGesture {
                            // Update lastSelectedCell and make it white
                            lastSelectedCell = selectedCell
                            lastSelectedCell.updateState(selected: false)

                            // Update selected cell and highlight it red
                            selectedCell = cell
                            selectedCell.updateState(selected: true)

                            updateDailyViewTitle(d: selectedCell.date)
                        }
                }
            }
            .padding(.horizontal, 30.0)
            .padding(.bottom)
            // end LazyVGrid
            
            Divider()
                .frame(height: 3)
                .background(Color.white)
            
            // MARK: Start Task List Section
            VStack(spacing: 10){
                HStack {
                    DailyViewTitle(dayTitle: $dayTitle, numTitle: $numTitle, suffix: $suffix)
                    // I don't understand why the above code works and the below code doesn't
                    //Text("\(dayTitle), \(numTitle)\(suffix)")
                    Spacer()
                }
                .font(.custom("Viga-Regular", size: 28, relativeTo: .title2))
                
                ScrollView {
                    LazyVStack(spacing: 0){
                        ForEach(tasks) { task in
                            if(task.isDue(d: selectedCell.date)) {
                                TaskCard(task: task)
                            }
                        }
                        
                    } // end LazyVStack
                } // end Scrollview
            }
            .padding()
            .background(Color.bg_dark.ignoresSafeArea())
            .foregroundColor(Color.white)
            // end VStack
        }
        .background(Color.bg_light.ignoresSafeArea())
        .foregroundColor(Color.white)
        // end VStack
    } // end body
    
    // MARK: Init
    init() {
        
        print("[INIT] calendar initialized")
        allCells = [[[Cell]]]()
        allDays = [[]]
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
                        cell.updateState(selected: true)
                        lastSelectedCell = cell
                        _selectedCell = State(initialValue: cell)
                    }
                    currentMonth.append(cell)
                }
                yearArr.append(currentMonth)
            }
            allCells.append(yearArr)
        }
        
        // Update the initial value of the Daily View title
        _dayTitle = State(initialValue: Calendar.current.weekdaySymbols[Calendar.current.component(.weekday, from: selectedCell.date) - 1])
        _numTitle = State(initialValue: Calendar.current.component(.day, from: selectedCell.date))
        _suffix = State(initialValue: getDaySuffix(Calendar.current.component(.day, from: selectedCell.date)))
        
        // Debug
//        createCells(d: Date())
    }
    
    // MARK: Custom Functions
    
    /// Creates cells for the calendar and adds them to the existing cells.
    ///
    /// - Precondition: The desired cells don't already exist in the cells array.
//    func createCells(d: Date) {
//        let nextMonth = calendar.date(byAdding: .month, value: 1, to: d)
//        var nextMonthDateComponents = calendar.dateComponents([.month, .day], from: nextMonth ?? Date())
//        nextMonthDateComponents.day = 1
//        let lastDayofThisMonth = calendar.date(byAdding: .day, value: -1, to: calendar.date(from: nextMonthDateComponents) ?? Date())
//        let currentDay = calendar.component(.day, from: d) - 1
//        let firstDayOfThisMonth = calendar.date(byAdding: .day, value: (-1) * currentDay, to: d)
//        var monthCells: [Cell] = []
//
//        for day in (1...calendar.component(.day, from: lastDayofThisMonth ?? Date())) {
//            //Cell(
//        }
//
//        print(firstDayOfThisMonth)
//        print(lastDayofThisMonth)
//    }
    
    /// Gets all the cells in a month and updates their task circle indicator.
    /// - Parameter d: Any date inside of a desired month.
    /// - Returns: The month of cells to be displayed if they exist.
    func getMonthCells(d: Date) -> [Cell]? {
        let year = Calendar.current.component(.year, from: d)
        let month = Calendar.current.component(.month, from: d)
        for yearArr in allCells {
            if (calendar.component(.year, from: yearArr[0][0].date) == year) {
                for monthArr in yearArr {
                    if (Calendar.current.component(.month, from: monthArr[0].date) == month) {
                        
                        // Reset all tasks indicators
                        for cell in monthArr {
                            cell.turnOffTaskIndicator()
                        }
                        
                        // Add indicators to cells with tasks due that day
                        for task in tasks {
                            let taskYear = calendar.component(.year, from: task.dueDate ?? Date())
                            let taskMonth = calendar.component(.month, from: task.dueDate ?? Date())
                            if(taskYear == year) {
                                // There is a task in the relevant month
                                if(taskMonth == month) {
                                    monthArr[calendar.component(.day, from: task.dueDate ?? Date()) - 1].turnOnTaskIndicator()
                                }
                            } else if(taskYear > year) {
                                
                            }
                        }
                        
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

// MARK: Small Helper Structs
struct DailyViewTitle: View {
    @Binding var dayTitle: String
    @Binding var numTitle: Int
    @Binding var suffix: String
    
    var body: some View {
        Text("\(dayTitle), \(numTitle)\(suffix)")
    }
}



private struct DayLabel: Identifiable {
    var id = UUID()
    let label: String
    
    init(_ label: String) {
        self.label = label
    }
}
