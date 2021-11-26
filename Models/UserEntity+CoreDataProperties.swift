//
//  UserEntity+CoreDataProperties.swift
//  AssignMe
//
//  Created by Ridgeway, Dalton D on 11/25/21.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var category: NSSet?
    
    public var wrappedName: String {
        name ?? "poop"
    }
    
    public var categoryArray: [CategoryEntity] {
        let set = category as? Set<CategoryEntity> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

}

// MARK: Generated accessors for category
extension UserEntity {

    @objc(addCategoryObject:)
    @NSManaged public func addToCategory(_ value: CategoryEntity)

    @objc(removeCategoryObject:)
    @NSManaged public func removeFromCategory(_ value: CategoryEntity)

    @objc(addCategory:)
    @NSManaged public func addToCategory(_ values: NSSet)

    @objc(removeCategory:)
    @NSManaged public func removeFromCategory(_ values: NSSet)

}

extension UserEntity : Identifiable {

}
