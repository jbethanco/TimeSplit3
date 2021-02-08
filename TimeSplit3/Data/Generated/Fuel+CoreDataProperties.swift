//
//  Fuel+CoreDataProperties.swift
//  TimeSplit3
//
//  Created by John Bethancourt on 2/7/21.
//
//

import Foundation
import CoreData


extension Fuel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Fuel> {
        return NSFetchRequest<Fuel>(entityName: "Fuel")
    }

    @NSManaged public var airRefuel: Float
    @NSManaged public var land: Float
    @NSManaged public var ramp: Float
    @NSManaged public var sortie: Sortie?

}

extension Fuel : Identifiable {

}
