//
//  Task.swift
//  AssignMe
//
//  Created by Rohan Jose on 10/15/21.
//
import Foundation
struct Task: Identifiable {
    let id = UUID()
    var name:String
    var category:Category
    var description:String
    var difficulty:Int
    var dueDate:Date
    var dateCompleted:Date
    var isOverdue:Bool
    
    init(name:String, category: Category, description: String, difficulty:Int, dueDate:Date,dateCompleted:Date, isOverdue:Bool){
        self.name=name
        self.category=category
        self.description=description
        self.difficulty=difficulty
        self.dueDate=dueDate
        self.dateCompleted=dateCompleted
        self.isOverdue=isOverdue
    }
    
}



struct TaskList {
    static let taskArray = [
        Task(
            name: "Go to the gym",
            category: Category(name: "fitness", color: .red),
            description: "100 push up, 100 situp, 10k run",
            difficulty: 5,
            dueDate: Date(),
            dateCompleted: Date(),
            isOverdue: Bool()
        ),
        Task(
            name: "Shopping",
            category: Category(name: "Pleasure", color: .yellow),
            description: "trying not to spend alot of money at the mall",
            difficulty: 5,
            dueDate: Date(),
            dateCompleted: Date(),
            isOverdue: Bool()
        ),
    ]
}




