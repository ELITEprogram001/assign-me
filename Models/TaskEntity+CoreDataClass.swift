//
//  TaskEntity+CoreDataClass.swift
//  AssignMe
//
//  Created by Ridgeway, Dalton D on 11/25/21.
//
//

import Foundation
import CoreData

@objc(TaskEntity)
public class TaskEntity: NSManagedObject {
    
    func isDue(d: Date) -> Bool {
        let dueDateComponents = Calendar.current.dateComponents([.year, .month, .day], from: self.dueDate ?? Date())
        let checkDateComponents = Calendar.current.dateComponents([.year, .month, .day], from: d)
        if(dueDateComponents.day == checkDateComponents.day) {
            if(dueDateComponents.month == checkDateComponents.month) {
                if(dueDateComponents.year == checkDateComponents.year) {
                    return true
                }
            }
        }
        return false
    }
    
}
