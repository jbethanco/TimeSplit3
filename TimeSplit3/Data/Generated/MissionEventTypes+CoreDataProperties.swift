//
//  MissionEventTypes+CoreDataProperties.swift
//  TimeSplit3
//
//  Created by John Bethancourt on 2/7/21.
//
//

import Foundation
import CoreData


extension MissionEventTypes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MissionEventTypes> {
        return NSFetchRequest<MissionEventTypes>(entityName: "MissionEventTypes")
    }

    @NSManaged public var eventID: String?
    @NSManaged public var frequency: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var events: NSSet?

}

// MARK: Generated accessors for events
extension MissionEventTypes {

    @objc(addEventsObject:)
    @NSManaged public func addToEvents(_ value: EventRecord)

    @objc(removeEventsObject:)
    @NSManaged public func removeFromEvents(_ value: EventRecord)

    @objc(addEvents:)
    @NSManaged public func addToEvents(_ values: NSSet)

    @objc(removeEvents:)
    @NSManaged public func removeFromEvents(_ values: NSSet)

}

extension MissionEventTypes : Identifiable {

}
