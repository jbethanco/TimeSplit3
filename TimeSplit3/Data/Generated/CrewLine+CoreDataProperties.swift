//
//  CrewLine+CoreDataProperties.swift
//  TimeSplit3
//
//  Created by John Bethancourt on 2/7/21.
//
//

import Foundation
import CoreData


extension CrewLine {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CrewLine> {
        return NSFetchRequest<CrewLine>(entityName: "CrewLine")
    }

    @NSManaged public var flightAuthDutyCode: String?
    @NSManaged public var reserveStatus: Int16
    @NSManaged public var events: NSSet?
    @NSManaged public var flightConditions: FlightConditions?
    @NSManaged public var flightTime: FlightTime?
    @NSManaged public var person: PBLPerson?
    @NSManaged public var sortie: Sortie?

}

// MARK: Generated accessors for events
extension CrewLine {

    @objc(addEventsObject:)
    @NSManaged public func addToEvents(_ value: EventRecord)

    @objc(removeEventsObject:)
    @NSManaged public func removeFromEvents(_ value: EventRecord)

    @objc(addEvents:)
    @NSManaged public func addToEvents(_ values: NSSet)

    @objc(removeEvents:)
    @NSManaged public func removeFromEvents(_ values: NSSet)

}

extension CrewLine : Identifiable {

}
