//
//  User.swift
//  AssignMe
//
//  Created by Rohan Jose on 10/28/21.
//
import SwiftUI
import Foundation
var Uncategorized = Category(name:"Uncategorized",color:Color.gray)

class User: ObservableObject {
    @Published var currTask: Task
    @Published var currTaskIndex: Int
    @Published var name: String
    @Published var taskList = [Task]()
    @Published var categoryList = [Category]()
    @Published var completedList = [Task]()
    @Published var availableColors = [Color]()
    init(name: String){
        self.name = name
        self.currTask = Task(
            name:"",
            category: Uncategorized,
            description:"",
            difficulty: 1,
            dueDate: Date(),
            dateCompleted: Date(),
            isOverdue: false )
        self.currTaskIndex = 0
    }
    func addCategory(cat:Category){
        categoryList.append(cat)
    }
}
