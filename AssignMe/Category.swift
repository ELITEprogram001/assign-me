//
//  Category.swift
//  AssignMe
//
//  Created by Rohan Jose on 10/15/21.
//
import SwiftUI
import Foundation
class Category{
    let id = UUID()
    var name:String
    var color:Color
    init(name:String, color:Color){
        self.name=name
        self.color=color
    }
}
