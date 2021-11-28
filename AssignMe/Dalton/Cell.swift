//
//  Cell.swift
//  AssignMe
//
//  Created by Ridgeway, Dalton D on 11/25/21.
//

import SwiftUI

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
            if(cellState.hasTasks) {
                Circle()
                    .fill(Color.white)
                    .frame(width: 7, height: 7)
            } else {
                Circle()
                    .fill(Color.bg_dark)
                    .frame(width: 7, height: 7)
            }
            Spacer()
        }
        .font(.custom("Ubuntu-Regular", size: 16, relativeTo: .body))
        .frame(minHeight: 60, maxHeight: 100)
        .contentShape(Rectangle())
    }
    
    func updateState (selected: Bool) {
        self.cellState.selected = selected
        if(selected) {
            self.cellState.color = Color.fg_main
        } else {
            self.cellState.color = Color.white
        }
    }
    
    func turnOnTaskIndicator() {
        cellState.hasTasks = true
    }
    
    func turnOffTaskIndicator() {
        cellState.hasTasks = false
    }
    
    /// Determines if two cells have matching years, months, and days.
    /// - Parameters:
    ///   - lhs: The first cell.
    ///   - rhs: The second cell.
    /// - Returns: True if they share the same year, month, and day.
    static func == (lhs: Cell, rhs: Cell) -> Bool {
        let lhsComp = Calendar.current.dateComponents([.day, .month, .year], from: lhs.date)
        let rhsComp = Calendar.current.dateComponents([.day, .month, .year], from: rhs.date)
        return (lhsComp.day == rhsComp.day) && (lhsComp.month == rhsComp.month) && (lhsComp.year == rhsComp.year)
    }
}

class CellState: ObservableObject {
    @Published var color = Color.white
    @Published var selected = false
    @Published var hasTasks: Bool = false
}

struct EmptyCell: Identifiable, Hashable {
    var id = UUID()
}

class Offsets {
    var offsets: [EmptyCell]
    
    init() {
        offsets = []
    }
}
