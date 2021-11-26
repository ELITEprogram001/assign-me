//
//  ColorDescription+CoreDataProperties.swift
//  AssignMe
//
//  Created by Ridgeway, Dalton D on 11/25/21.
//
//

import Foundation
import CoreData


extension ColorDescription {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ColorDescription> {
        return NSFetchRequest<ColorDescription>(entityName: "ColorDescription")
    }

    @NSManaged public var r: Double
    @NSManaged public var g: Double
    @NSManaged public var b: Double
    @NSManaged public var category: CategoryEntity?

    
}

extension ColorDescription : Identifiable {

}
