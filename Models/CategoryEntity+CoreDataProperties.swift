//
//  CategoryEntity+CoreDataProperties.swift
//  AssignMe
//
//  Created by Ridgeway, Dalton D on 11/25/21.
//
//

import Foundation
import CoreData


extension CategoryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryEntity> {
        return NSFetchRequest<CategoryEntity>(entityName: "CategoryEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var color: String?
    @NSManaged public var colorDescription: ColorDescription?
    @NSManaged public var task: NSSet?

    public var wrappedName: String {
        name ?? "Default Cat"
    }
    
    public var wrappedColor: String {
        color ?? "red"
    }
    
    public var wrappedColorDesc: ColorDescription {
        colorDescription ?? ColorDescription()
    }
    
    public var taskArray: [TaskEntity] {
        let set = task as? Set<TaskEntity> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
    
}

// MARK: Generated accessors for task
extension CategoryEntity {

    @objc(addTaskObject:)
    @NSManaged public func addToTask(_ value: TaskEntity)

    @objc(removeTaskObject:)
    @NSManaged public func removeFromTask(_ value: TaskEntity)

    @objc(addTask:)
    @NSManaged public func addToTask(_ values: NSSet)

    @objc(removeTask:)
    @NSManaged public func removeFromTask(_ values: NSSet)

}

extension CategoryEntity : Identifiable {

}
