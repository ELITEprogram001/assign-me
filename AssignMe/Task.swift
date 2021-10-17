//
//  Task.swift
//  AssignMe
//
//  Created by Rohan Jose on 10/15/21.
//
import Foundation
class Task{
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
    func listAttributes() -> String{
        return "name: \(self.name) \ncategory: \(self.category.name)\ndescription: \(self.description)\ndifficulty: \(self.difficulty)"
    }
}
