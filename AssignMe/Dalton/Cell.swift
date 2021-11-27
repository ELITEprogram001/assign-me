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
        VStack(spacing: 3) {
            Divider()
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 1)
                .padding(.vertical, 0)
                .background(Color.gray)
            Text(day).bold()
                .foregroundColor(cellState.color)
            if(true) {
                Circle()
                    .fill(Color.white)
                    .frame(width: 5, height: 5)
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
            self.cellState.color = Color.bright_maroon
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

struct EmptyCell: Identifiable, Hashable {
    var id = UUID()
}

class Offsets {
    var offsets: [EmptyCell]
    
    init() {
        offsets = []
    }
}
