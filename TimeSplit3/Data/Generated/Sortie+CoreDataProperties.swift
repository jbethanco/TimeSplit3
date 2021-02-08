//
//  Sortie+CoreDataProperties.swift
//  TimeSplit3
//
//  Created by John Bethancourt on 2/7/21.
//
//

import Foundation
import CoreData


extension Sortie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sortie> {
        return NSFetchRequest<Sortie>(entityName: "Sortie")
    }

    @NSManaged public var auxillaryPowerUnitHours: Float
    @NSManaged public var harmLocation: String?
    @NSManaged public var landICAO: String?
    @NSManaged public var landTime: String?
    @NSManaged public var mds: String?
    @NSManaged public var serialNumber: String?
    @NSManaged public var takeoffCenterOfGravity: Float
    @NSManaged public var takeoffICAO: Date?
    @NSManaged public var takeoffTime: Date?
    @NSManaged public var unitCharged: String?
    @NSManaged public var crewLines: NSSet?
    @NSManaged public var fuel: Fuel?
    @NSManaged public var metrics: Metrics?
    @NSManaged public var mission: Mission?
    @NSManaged public var sortieType: SortieType?

}

// MARK: Generated accessors for crewLines
extension Sortie {

    @objc(addCrewLinesObject:)
    @NSManaged public func addToCrewLines(_ value: CrewLine)

    @objc(removeCrewLinesObject:)
    @NSManaged public func removeFromCrewLines(_ value: CrewLine)

    @objc(addCrewLines:)
    @NSManaged public func addToCrewLines(_ values: NSSet)

    @objc(removeCrewLines:)
    @NSManaged public func removeFromCrewLines(_ values: NSSet)

}

extension Sortie : Identifiable {

}
