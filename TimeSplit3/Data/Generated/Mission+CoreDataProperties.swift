//
//  Mission+CoreDataProperties.swift
//  TimeSplit3
//
//  Created by John Bethancourt on 2/7/21.
//
//

import Foundation
import CoreData


extension Mission {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mission> {
        return NSFetchRequest<Mission>(entityName: "Mission")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var summary: String?
    @NSManaged public var sorties: NSSet?

}

// MARK: Generated accessors for sorties
extension Mission {

    @objc(addSortiesObject:)
    @NSManaged public func addToSorties(_ value: Sortie)

    @objc(removeSortiesObject:)
    @NSManaged public func removeFromSorties(_ value: Sortie)

    @objc(addSorties:)
    @NSManaged public func addToSorties(_ values: NSSet)

    @objc(removeSorties:)
    @NSManaged public func removeFromSorties(_ values: NSSet)

}

extension Mission : Identifiable {

}
