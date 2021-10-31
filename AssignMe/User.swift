//
//  User.swift
//  AssignMe
//
//  Created by Rohan Jose on 10/28/21.
//
import SwiftUI
import Foundation
class User{
    var taskList = [Task]()
    var categoryList = [Category]()
    var completedList = [Task]()
    var availableColors = [Color]()
    init(){
        availableColors.append(Color.black)
        availableColors.append(Color.red)
        availableColors.append(Color.green)
        availableColors.append(Color.blue)
        availableColors.append(Color.yellow)
        availableColors.append(Color.orange)
        availableColors.append(Color.purple)
    }
    func addCategory(cat:Category){
        categoryList.append(cat)
    }
}
