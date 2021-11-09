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
    @State var monthTitle = "September"
    @State var dayTitle = "Tuesday"
    @State var numTitle = "8"
    private let dayLabels = [DayLabel("S"),DayLabel("M"),DayLabel("T"),DayLabel("W"),DayLabel("T"),DayLabel("F"),DayLabel("S")]
    private let monthNames = Calendar.current.monthSymbols
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
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "arrow.left")
                }
                .foregroundColor(.red)
                Spacer()
                Text(monthNames[Calendar.current.component(.month, from: date) - 1])
                    .bold()
                    .font(.custom("Viga-Regular", size: 40, relativeTo: .title))
                Spacer()
                Button(action: {}) {
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
                    var cell = createCell(id: day, cellDate: date)
                    cell.onTapGesture {
                        if(lastSelectedCell != cell) {
                            lastSelectedCell.updateColor(color: Color.white)
                            lastSelectedCell.selected = false
                            cell.selected = true
                            cell.updateColor(color: Color.red)
            
                            print("Last: \(lastSelectedCell.id)")
                            print("Curr: \(cell.id)")
                            lastSelectedCell = cell
                        }
                    }
                }
            }
            .padding(.horizontal, 30.0)
            .padding(.bottom)
            .onTapGesture {
                // delete later
                print("tapped on grid")
            }
            // end LazyVGrid
            Divider()
                .frame(height: 4)
                .background(Color.white)
            VStack(spacing: 10){
                HStack {
                    let comp = Calendar.current.dateComponents([.weekday, .day], from: date)
                    let suffix: String = getDaySuffix(comp.day ?? 0)
                    Text("\(Calendar.current.standaloneWeekdaySymbols[(comp.weekday ?? 1) - 1]), \(comp.day ?? 0)\(suffix)")
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
    
    init(){
        // Initialized with the current date on calendar load
    }
    
    func createCell(id: Int, cellDate: Date) -> Cell {
        var cellComp = Calendar.current.dateComponents([.year, .day, .weekday, .month], from: cellDate)
        cellComp.day = id
        let cell = Cell(id: id, id.description, date: Calendar.current.date(from: cellComp) ?? date)
        if(Calendar.current.component(.day, from: cell.date) == Calendar.current.component(.day, from: date)) {
            print("Cell: \(cell)")
            cell.updateColor(color: .red)
            cell.selected = true
            lastSelectedCell = cell
        }
        return cell
    }
    
    func updateDayCard() {
        
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
        return lhs.day == rhs.day
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
