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
    @State var dayTitle = "Error"
    @State var numTitle = 99
    @State var suffix = "Error"
    private let dayLabels = [DayLabel("S"),DayLabel("M"),DayLabel("T"),DayLabel("W"),DayLabel("T"),DayLabel("F"),DayLabel("S")]
    private var shift = Offsets()
    @State var lastSelectedCell = Cell(id: 99, "99", date: Date())
    @ObservedObject var cellColorState = ColorState()

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
                ForEach((1...getLastDay()), id: \.self) { day in
                    let cell = createCell(id: day, cellDate: date)
                    cell.onTapGesture {
                        print("[DATE: cell.ontap] \(date)")
                        print("[COMPARE LAST: cell.ontap] \(lastSelectedCell.date)")
                        print("[COMPARE CURR: cell.ontap] \(cell.date)")
                        if(lastSelectedCell == cell) {
                            print("[COMPARE] cells are equal")
                        } else {
                            lastSelectedCell.updateColor(color: Color.white)
                            lastSelectedCell.selected = false
                            cell.selected = true
                            cell.updateColor(color: Color.red)
            
                            updateDailyViewTitle(d: cell.date)
                            
                            lastSelectedCell = cell
                        }
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
        print("init called")
    }
    
    func createCell(id: Int, cellDate: Date) -> Cell {
        var cellDateComp = Calendar.current.dateComponents([.year, .day, .weekday, .month], from: cellDate)
        cellDateComp.day = id
        let cell = Cell(id: id, id.description, date: Calendar.current.date(from: cellDateComp) ?? date)
        // Need to compare year, month, and day
        if(Calendar.current.component(.day, from: cell.date) == Calendar.current.component(.day, from: Date()) && Calendar.current.component(.month, from: cell.date) == Calendar.current.component(.month, from: Date()) && Calendar.current.component(.year, from: cell.date) == Calendar.current.component(.year, from: Date())) {
            cell.updateColor(color: .red)
            cell.selected = true
            dayTitle = Calendar.current.shortStandaloneWeekdaySymbols[(cellDateComp.weekday ?? 1) - 1]
            lastSelectedCell = cell
        } else {
            cell.selected = false
            cell.updateColor(color: Color.white)
        }
        return cell
    }
    
    func getOffset() -> [EmptyCell] {
        shift.offsets.removeAll()
        let firstWeekday = getFirstWeekdayOfMonth(d: date)
        for _ in 1...(firstWeekday - 1) {
            shift.offsets.append(EmptyCell())
        }
        return shift.offsets
    }
    
    func getFirstWeekdayOfMonth(d: Date) -> Int{
        var comp = Calendar.current.dateComponents([.year, .month, .day, .weekday], from: d)
        comp.day = 1
        let firstDay = Calendar.current.date(from: comp)
        print(firstDay!)
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
    let id: Int
    let date: Date
    @ObservedObject var color: ColorState
    @State var selected = false
    
    init(id: Int, _ day: String, date: Date) {
        self.day = day
        self.id = id
        self.date = date
        self.color = ColorState()
    }
    
    var body: some View {
        VStack(spacing: 3){
            Divider()
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 1)
                .padding(.vertical, 0)
                .background(Color.gray)
            Text(day).bold()
                .foregroundColor(color.color)
            Spacer()
        }
        .font(.custom("Ubuntu-Regular", size: 16, relativeTo: .body))
        .frame(minHeight: 60, maxHeight: 100)
        .contentShape(Rectangle())
    }
    
    func updateColor (color: Color) {
        print("Changing cell \(id) to color: \(color)")
        self.color.color = color
    }
    
    static func == (lhs: Cell, rhs: Cell) -> Bool {
        let lhsComp = Calendar.current.dateComponents([.day, .month, .year], from: lhs.date)
        let rhsComp = Calendar.current.dateComponents([.day, .month, .year], from: rhs.date)
        return (lhsComp.day == rhsComp.day) && (lhsComp.month == rhsComp.month) && (lhsComp.year == rhsComp.year)
    }
}

class ColorState: ObservableObject {
    @Published var color = Color.white
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
