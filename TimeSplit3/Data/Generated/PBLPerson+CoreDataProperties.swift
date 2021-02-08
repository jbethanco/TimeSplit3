//
//  PBLPerson+CoreDataProperties.swift
//  TimeSplit3
//
//  Created by John Bethancourt on 2/7/21.
//
//

import Foundation
import CoreData


extension PBLPerson {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PBLPerson> {
        return NSFetchRequest<PBLPerson>(entityName: "PBLPerson")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var last4: String?
    @NSManaged public var lastName: String?
    @NSManaged public var organization: String?
    @NSManaged public var rank: Int16
    @NSManaged public var crewLines: NSSet?

}

// MARK: Generated accessors for crewLines
extension PBLPerson {

    @objc(addCrewLinesObject:)
    @NSManaged public func addToCrewLines(_ value: CrewLine)

    @objc(removeCrewLinesObject:)
    @NSManaged public func removeFromCrewLines(_ value: CrewLine)

    @objc(addCrewLines:)
    @NSManaged public func addToCrewLines(_ values: NSSet)

    @objc(removeCrewLines:)
    @NSManaged public func removeFromCrewLines(_ values: NSSet)

}

extension PBLPerson : Identifiable {

}
