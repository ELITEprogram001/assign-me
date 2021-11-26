//
//  TaskEntity+CoreDataProperties.swift
//  AssignMe
//
//  Created by Ridgeway, Dalton D on 11/25/21.
//
//

import Foundation
import CoreData


extension TaskEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskEntity> {
        return NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
    }

    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var difficulty: Int64
    @NSManaged public var dueDate: Date?
    @NSManaged public var category: CategoryEntity?
    
    public var wrappedTitle: String {
        title ?? "Default Task Title"
    }
    
    public var wrappedDesc: String {
        desc ?? "This is the default task description."
    }
    

}

extension TaskEntity : Identifiable {

}
