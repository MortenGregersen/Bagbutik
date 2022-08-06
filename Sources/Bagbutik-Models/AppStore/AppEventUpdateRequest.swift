import Bagbutik_Core
import Foundation

public struct AppEventUpdateRequest: Codable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public struct Data: Codable, Identifiable {
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
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(attributes, forKey: .attributes)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case id
            case type
        }

        public struct Attributes: Codable {
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

            public struct TerritorySchedules: Codable {
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
            }
        }
    }
}
