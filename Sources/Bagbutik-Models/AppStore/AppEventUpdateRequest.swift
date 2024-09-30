import Bagbutik_Core
import Foundation

public struct AppEventUpdateRequest: Codable, Sendable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
    }

    public struct Data: Codable, Sendable, Identifiable {
        public let id: String
        public var type: String { "appEvents" }
        public var attributes: Attributes?

        public init(id: String,
                    attributes: Attributes? = nil)
        {
            self.id = id
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            id = try container.decode(String.self, forKey: "id")
            attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(id, forKey: "id")
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(attributes, forKey: "attributes")
        }

        public struct Attributes: Codable, Sendable {
            public var badge: AppEvent.Attributes.Badge?
            public var deepLink: String?
            public var primaryLocale: String?
            public var priority: AppEvent.Attributes.Priority?
            public var purchaseRequirement: AppEvent.Attributes.PurchaseRequirement?
            public var purpose: AppEvent.Attributes.Purpose?
            public var referenceName: String?
            public var territorySchedules: [TerritorySchedules]?

            public init(badge: AppEvent.Attributes.Badge? = nil,
                        deepLink: String? = nil,
                        primaryLocale: String? = nil,
                        priority: AppEvent.Attributes.Priority? = nil,
                        purchaseRequirement: AppEvent.Attributes.PurchaseRequirement? = nil,
                        purpose: AppEvent.Attributes.Purpose? = nil,
                        referenceName: String? = nil,
                        territorySchedules: [TerritorySchedules]? = nil)
            {
                self.badge = badge
                self.deepLink = deepLink
                self.primaryLocale = primaryLocale
                self.priority = priority
                self.purchaseRequirement = purchaseRequirement
                self.purpose = purpose
                self.referenceName = referenceName
                self.territorySchedules = territorySchedules
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                badge = try container.decodeIfPresent(AppEvent.Attributes.Badge.self, forKey: "badge")
                deepLink = try container.decodeIfPresent(String.self, forKey: "deepLink")
                primaryLocale = try container.decodeIfPresent(String.self, forKey: "primaryLocale")
                priority = try container.decodeIfPresent(AppEvent.Attributes.Priority.self, forKey: "priority")
                purchaseRequirement = try container.decodeIfPresent(AppEvent.Attributes.PurchaseRequirement.self, forKey: "purchaseRequirement")
                purpose = try container.decodeIfPresent(AppEvent.Attributes.Purpose.self, forKey: "purpose")
                referenceName = try container.decodeIfPresent(String.self, forKey: "referenceName")
                territorySchedules = try container.decodeIfPresent([TerritorySchedules].self, forKey: "territorySchedules")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(badge, forKey: "badge")
                try container.encodeIfPresent(deepLink, forKey: "deepLink")
                try container.encodeIfPresent(primaryLocale, forKey: "primaryLocale")
                try container.encodeIfPresent(priority, forKey: "priority")
                try container.encodeIfPresent(purchaseRequirement, forKey: "purchaseRequirement")
                try container.encodeIfPresent(purpose, forKey: "purpose")
                try container.encodeIfPresent(referenceName, forKey: "referenceName")
                try container.encodeIfPresent(territorySchedules, forKey: "territorySchedules")
            }

            public struct TerritorySchedules: Codable, Sendable {
                public var eventEnd: Date?
                public var eventStart: Date?
                public var publishStart: Date?
                public var territories: [String]?

                public init(eventEnd: Date? = nil,
                            eventStart: Date? = nil,
                            publishStart: Date? = nil,
                            territories: [String]? = nil)
                {
                    self.eventEnd = eventEnd
                    self.eventStart = eventStart
                    self.publishStart = publishStart
                    self.territories = territories
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    eventEnd = try container.decodeIfPresent(Date.self, forKey: "eventEnd")
                    eventStart = try container.decodeIfPresent(Date.self, forKey: "eventStart")
                    publishStart = try container.decodeIfPresent(Date.self, forKey: "publishStart")
                    territories = try container.decodeIfPresent([String].self, forKey: "territories")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(eventEnd, forKey: "eventEnd")
                    try container.encodeIfPresent(eventStart, forKey: "eventStart")
                    try container.encodeIfPresent(publishStart, forKey: "publishStart")
                    try container.encodeIfPresent(territories, forKey: "territories")
                }
            }
        }
    }
}
