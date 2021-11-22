//
//  User.swift
//  AssignMe
//
//  Created by Rohan Jose on 10/28/21.
//
import SwiftUI
import Foundation

class User: ObservableObject {
    @Published var currCategoryIndex: Int
    @Published var name: String
    @Published var taskList = [Task]()
    @Published var categoryList = [Category]()
    @Published var completedList = [Task]()
    @Published var availableColors = [Color]()
    init(name: String){
        self.name = name
        
        self.currCategoryIndex = 0
    }
    func addCategory(cat:Category){
        categoryList.append(cat)
    }
}
