 
 
//
//   let element = try Element(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.elementTask(with: url) { Element, response, error in
//     if let element = Element {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Element
struct Element: Codable {
    var primaryEvent, conflictingEvent: Event
    var person: Person
    var reason: Reason
    var active: Bool
    var waivedByUserID: String?
    var lastUpdatedTime, id: String

    enum CodingKeys: String, CodingKey {
        case primaryEvent, conflictingEvent, person, reason, active
        case waivedByUserID = "waivedByUserId"
        case lastUpdatedTime, id
    }
}

// MARK: Element convenience initializers and mutators

extension Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Element.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        primaryEvent: Event? = nil,
        conflictingEvent: Event? = nil,
        person: Person? = nil,
        reason: Reason? = nil,
        active: Bool? = nil,
        waivedByUserID: String?? = nil,
        lastUpdatedTime: String? = nil,
        id: String? = nil
    ) -> Element {
        return Element(
            primaryEvent: primaryEvent ?? self.primaryEvent,
            conflictingEvent: conflictingEvent ?? self.conflictingEvent,
            person: person ?? self.person,
            reason: reason ?? self.reason,
            active: active ?? self.active,
            waivedByUserID: waivedByUserID ?? self.waivedByUserID,
            lastUpdatedTime: lastUpdatedTime ?? self.lastUpdatedTime,
            id: id ?? self.id
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Event.swift
 
// To read values from URLs:
//
//   let task = URLSession.shared.eventTask(with: url) { event, response, error in
//     if let event = event {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Event
struct Event: Codable {
    var eventType: Int
    var name, id, startTime, endTime: String
    var notes: String
    var roleAssignments: [RoleAssignment]
    var postCrewRESTTime, preCrewRESTTimeHard, preCrewRESTTimeSoft: Int
    var updating: JSONNull?
    var organizationID: String
    var additionalValues: AdditionalValues?

    enum CodingKeys: String, CodingKey {
        case eventType, name, id, startTime, endTime, notes, roleAssignments
        case postCrewRESTTime = "postCrewRestTime"
        case preCrewRESTTimeHard = "preCrewRestTimeHard"
        case preCrewRESTTimeSoft = "preCrewRestTimeSoft"
        case updating
        case organizationID = "organizationId"
        case additionalValues
    }
}

// MARK: Event convenience initializers and mutators

extension Event {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Event.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        eventType: Int? = nil,
        name: String? = nil,
        id: String? = nil,
        startTime: String? = nil,
        endTime: String? = nil,
        notes: String? = nil,
        roleAssignments: [RoleAssignment]? = nil,
        postCrewRESTTime: Int? = nil,
        preCrewRESTTimeHard: Int? = nil,
        preCrewRESTTimeSoft: Int? = nil,
        updating: JSONNull?? = nil,
        organizationID: String? = nil,
        additionalValues: AdditionalValues?? = nil
    ) -> Event {
        return Event(
            eventType: eventType ?? self.eventType,
            name: name ?? self.name,
            id: id ?? self.id,
            startTime: startTime ?? self.startTime,
            endTime: endTime ?? self.endTime,
            notes: notes ?? self.notes,
            roleAssignments: roleAssignments ?? self.roleAssignments,
            postCrewRESTTime: postCrewRESTTime ?? self.postCrewRESTTime,
            preCrewRESTTimeHard: preCrewRESTTimeHard ?? self.preCrewRESTTimeHard,
            preCrewRESTTimeSoft: preCrewRESTTimeSoft ?? self.preCrewRESTTimeSoft,
            updating: updating ?? self.updating,
            organizationID: organizationID ?? self.organizationID,
            additionalValues: additionalValues ?? self.additionalValues
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// AdditionalValues.swift
//
//   let additionalValues = try AdditionalValues(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.additionalValuesTask(with: url) { additionalValues, response, error in
//     if let additionalValues = additionalValues {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - AdditionalValues
struct AdditionalValues: Codable {
}

// MARK: AdditionalValues convenience initializers and mutators

extension AdditionalValues {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(AdditionalValues.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
    ) -> AdditionalValues {
        return AdditionalValues(
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// RoleAssignment.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let roleAssignment = try RoleAssignment(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.roleAssignmentTask(with: url) { roleAssignment, response, error in
//     if let roleAssignment = roleAssignment {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - RoleAssignment
struct RoleAssignment: Codable {
    var personID: String?
    var eventID, id: String
    var index: Int
    var confirmationStatus: ConfirmationStatus?
    var jobRole: JobRoleElement
    var notes: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case personID = "personId"
        case eventID = "eventId"
        case id, index, confirmationStatus, jobRole, notes
    }
}

// MARK: RoleAssignment convenience initializers and mutators

extension RoleAssignment {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RoleAssignment.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        personID: String?? = nil,
        eventID: String? = nil,
        id: String? = nil,
        index: Int? = nil,
        confirmationStatus: ConfirmationStatus?? = nil,
        jobRole: JobRoleElement? = nil,
        notes: [JSONAny]? = nil
    ) -> RoleAssignment {
        return RoleAssignment(
            personID: personID ?? self.personID,
            eventID: eventID ?? self.eventID,
            id: id ?? self.id,
            index: index ?? self.index,
            confirmationStatus: confirmationStatus ?? self.confirmationStatus,
            jobRole: jobRole ?? self.jobRole,
            notes: notes ?? self.notes
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// ConfirmationStatus.swift

import Foundation

enum ConfirmationStatus: String, Codable {
    case confirmed = "CONFIRMED"
    case notContacted = "NOT_CONTACTED"
}

// JobRoleElement.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let jobRoleElement = try JobRoleElement(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.jobRoleElementTask(with: url) { jobRoleElement, response, error in
//     if let jobRoleElement = jobRoleElement {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - JobRoleElement
struct JobRoleElement: Codable {
    var roleType, roleName: String
    var id: Int
    var organizationID: String
    var active: Bool
    var abbreviation: Abbreviation

    enum CodingKeys: String, CodingKey {
        case roleType, roleName, id
        case organizationID = "organizationId"
        case active, abbreviation
    }
}

// MARK: JobRoleElement convenience initializers and mutators

extension JobRoleElement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(JobRoleElement.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        roleType: String? = nil,
        roleName: String? = nil,
        id: Int? = nil,
        organizationID: String? = nil,
        active: Bool? = nil,
        abbreviation: Abbreviation? = nil
    ) -> JobRoleElement {
        return JobRoleElement(
            roleType: roleType ?? self.roleType,
            roleName: roleName ?? self.roleName,
            id: id ?? self.id,
            organizationID: organizationID ?? self.organizationID,
            active: active ?? self.active,
            abbreviation: abbreviation ?? self.abbreviation
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Abbreviation.swift

import Foundation

enum Abbreviation: String, Codable {
    case abbreviationIS = "IS"
    case e = "E"
    case e2 = "E2"
    case e4 = "E4"
    case empty = ""
    case es = "ES"
    case f = "F"
    case f5 = "F5"
    case fc = "FC"
    case i = "I"
    case i2 = "I2"
    case i3 = "I3"
    case i4 = "I4"
    case i5 = "I5"
    case la = "LA"
    case m = "M"
    case m3 = "M3"
    case m4 = "M4"
    case m5 = "M5"
    case mA = "M(A"
    case ms = "MS"
    case u = "U"
}

// Person.swift
 
//
//   let person = try Person(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.personTask(with: url) { person, response, error in
//     if let person = person {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Person
struct Person: Codable {
    var id: String
    var roleAssignments: JSONNull?
    var callSign: CallSign?
    var lastName, firstName: String
    var contactNumber: String?
    var email: Email?
    var dodID: Int
    var rankID: Int?
    var organizationStatus: [String: OrganizationStatus]?
    var primaryOrganizationID: String

    enum CodingKeys: String, CodingKey {
        case id, roleAssignments, callSign, lastName, firstName, contactNumber, email
        case dodID = "dodId"
        case rankID = "rankId"
        case organizationStatus
        case primaryOrganizationID = "primaryOrganizationId"
    }
}

// MARK: Person convenience initializers and mutators

extension Person {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Person.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: String? = nil,
        roleAssignments: JSONNull?? = nil,
        callSign: CallSign?? = nil,
        lastName: String? = nil,
        firstName: String? = nil,
        contactNumber: String?? = nil,
        email: Email?? = nil,
        dodID: Int? = nil,
        rankID: Int?? = nil,
        organizationStatus: [String: OrganizationStatus]?? = nil,
        primaryOrganizationID: String? = nil
    ) -> Person {
        return Person(
            id: id ?? self.id,
            roleAssignments: roleAssignments ?? self.roleAssignments,
            callSign: callSign ?? self.callSign,
            lastName: lastName ?? self.lastName,
            firstName: firstName ?? self.firstName,
            contactNumber: contactNumber ?? self.contactNumber,
            email: email ?? self.email,
            dodID: dodID ?? self.dodID,
            rankID: rankID ?? self.rankID,
            organizationStatus: organizationStatus ?? self.organizationStatus,
            primaryOrganizationID: primaryOrganizationID ?? self.primaryOrganizationID
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// CallSign.swift

import Foundation

enum CallSign: String, Codable {
    case empty = ""
    case fpn = "FPN"
    case ip = "IP"
    case ipLeadSIP = "IP, LEAD, SIP"
    case jLo = "JLo"
    case mpCpad = "MP, CPAD"
    case tork = "TORK"
}

// Email.swift

import Foundation

enum Email: String, Codable {
    case christianvoytkoYahooCOM = "christianvoytko@yahoo.com"
    case empty = ""
    case patrickDegraafUsAFMil = "PATRICK.DEGRAAF@US.AF.MIL"
}

// OrganizationStatus.swift
 
//   let organizationStatus = try OrganizationStatus(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.organizationStatusTask(with: url) { organizationStatus, response, error in
//     if let organizationStatus = organizationStatus {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - OrganizationStatus
struct OrganizationStatus: Codable {
    var active: Bool
    var organizationID: String
    var jobRoleID: Int

    enum CodingKeys: String, CodingKey {
        case active
        case organizationID = "organizationId"
        case jobRoleID = "jobRoleId"
    }
}

// MARK: OrganizationStatus convenience initializers and mutators

extension OrganizationStatus {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(OrganizationStatus.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        active: Bool? = nil,
        organizationID: String? = nil,
        jobRoleID: Int? = nil
    ) -> OrganizationStatus {
        return OrganizationStatus(
            active: active ?? self.active,
            organizationID: organizationID ?? self.organizationID,
            jobRoleID: jobRoleID ?? self.jobRoleID
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Reason.swift

import Foundation

enum Reason: String, Codable {
    case preAndPostCrewRESTViolation = "PRE_AND_POST_CREW_REST_VIOLATION"
    case preCrewRESTViolation = "PRE_CREW_REST_VIOLATION"
    case timeOverlap = "TIME_OVERLAP"
}

// CompatibilityElement.swift
 
//   let compatibilityElement = try CompatibilityElement(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.compatibilityElementTask(with: url) { compatibilityElement, response, error in
//     if let compatibilityElement = compatibilityElement {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - CompatibilityElement
struct CompatibilityElement: Codable {
    var jobRole: Int
    var compatibleJobRoles: [Int]
}

// MARK: CompatibilityElement convenience initializers and mutators

extension CompatibilityElement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CompatibilityElement.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        jobRole: Int? = nil,
        compatibleJobRoles: [Int]? = nil
    ) -> CompatibilityElement {
        return CompatibilityElement(
            jobRole: jobRole ?? self.jobRole,
            compatibleJobRoles: compatibleJobRoles ?? self.compatibleJobRoles
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// EventType.swift
 
//   let eventType = try EventType(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.eventTypeTask(with: url) { eventType, response, error in
//     if let eventType = eventType {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - EventType
struct EventType: Codable {
    var name, icon: String
    var id: Int
    var tag, organizationID, color: String
    var active: Bool
    var personnelSelectType: Int
    var eventFields: [EventField]
    var preCrewREST: Int
    var postCrewREST: PostCrewREST
    var defaultJobRoles: [JSONAny]
    var creatableByMember: Bool
    var index: Int?

    enum CodingKeys: String, CodingKey {
        case name, icon, id, tag
        case organizationID = "organizationId"
        case color, active, personnelSelectType, eventFields
        case preCrewREST = "preCrewRest"
        case postCrewREST = "postCrewRest"
        case defaultJobRoles, creatableByMember, index
    }
}

// MARK: EventType convenience initializers and mutators

extension EventType {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(EventType.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        name: String? = nil,
        icon: String? = nil,
        id: Int? = nil,
        tag: String? = nil,
        organizationID: String? = nil,
        color: String? = nil,
        active: Bool? = nil,
        personnelSelectType: Int? = nil,
        eventFields: [EventField]? = nil,
        preCrewREST: Int? = nil,
        postCrewREST: PostCrewREST? = nil,
        defaultJobRoles: [JSONAny]? = nil,
        creatableByMember: Bool? = nil,
        index: Int?? = nil
    ) -> EventType {
        return EventType(
            name: name ?? self.name,
            icon: icon ?? self.icon,
            id: id ?? self.id,
            tag: tag ?? self.tag,
            organizationID: organizationID ?? self.organizationID,
            color: color ?? self.color,
            active: active ?? self.active,
            personnelSelectType: personnelSelectType ?? self.personnelSelectType,
            eventFields: eventFields ?? self.eventFields,
            preCrewREST: preCrewREST ?? self.preCrewREST,
            postCrewREST: postCrewREST ?? self.postCrewREST,
            defaultJobRoles: defaultJobRoles ?? self.defaultJobRoles,
            creatableByMember: creatableByMember ?? self.creatableByMember,
            index: index ?? self.index
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// EventField.swift
//   let eventField = try EventField(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.eventFieldTask(with: url) { eventField, response, error in
//     if let eventField = eventField {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - EventField
struct EventField: Codable {
    var id: String
    var fieldType: FieldType
    var name: Name
    var active: Bool
    var eventTypeID, index: Int

    enum CodingKeys: String, CodingKey {
        case id, fieldType, name, active
        case eventTypeID = "eventTypeId"
        case index
    }
}

// MARK: EventField convenience initializers and mutators

extension EventField {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(EventField.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: String? = nil,
        fieldType: FieldType? = nil,
        name: Name? = nil,
        active: Bool? = nil,
        eventTypeID: Int? = nil,
        index: Int? = nil
    ) -> EventField {
        return EventField(
            id: id ?? self.id,
            fieldType: fieldType ?? self.fieldType,
            name: name ?? self.name,
            active: active ?? self.active,
            eventTypeID: eventTypeID ?? self.eventTypeID,
            index: index ?? self.index
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// FieldType.swift

import Foundation

enum FieldType: String, Codable {
    case string = "STRING"
}

// Name.swift

import Foundation

enum Name: String, Codable {
    case flightPlan = "Flight Plan"
    case landingLocation = "Landing Location"
    case takeoffLocation = "Takeoff Location"
}

// PostCrewREST.swift

import Foundation

enum PostCrewREST: String, Codable {
    case durationDiv3_Max96 = "DURATION_DIV_3_MAX_96"
    case none = "NONE"
}

// JSONSchemaSupport.swift

import Foundation

typealias Elements = [Element]
typealias Compatibility = [CompatibilityElement]
typealias Events = [Event]
typealias EventTypes = [EventType]
typealias JobRole = [JobRoleElement]
typealias Personnel = [Person]

extension Array where Element == Elements.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Elements.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Array where Element == Compatibility.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Compatibility.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Array where Element == Events.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Events.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Array where Element == EventTypes.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(EventTypes.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Array where Element == JobRole.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(JobRole.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Array where Element == Personnel.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Personnel.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func Element(with url: URL, completionHandler: @escaping (Element?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }

    func compatibilityTask(with url: URL, completionHandler: @escaping (Compatibility?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }

    func eventsTask(with url: URL, completionHandler: @escaping (Events?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }

    func eventTypesTask(with url: URL, completionHandler: @escaping (EventTypes?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }

    func jobRoleTask(with url: URL, completionHandler: @escaping (JobRole?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }

    func personnelTask(with url: URL, completionHandler: @escaping (Personnel?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
