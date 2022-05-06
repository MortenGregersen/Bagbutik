import Foundation

public struct AppEventCreateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appeventcreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "appEvents" }
        /// The resource's attributes.
        public let attributes: Attributes
        /// The relationships to other resources that you can set with this request.
        public let relationships: Relationships

        public init(attributes: Attributes, relationships: Relationships) {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decode(Attributes.self, forKey: .attributes)
            relationships = try container.decode(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(attributes, forKey: .attributes)
            try container.encode(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case type
            case attributes
            case relationships
        }

        public struct Attributes: Codable {
            public var badge: AppEvent.Attributes.Badge?
            public var deepLink: String?
            public var primaryLocale: String?
            public var priority: AppEvent.Attributes.Priority?
            public var purchaseRequirement: AppEvent.Attributes.PurchaseRequirement?
            public var purpose: AppEvent.Attributes.Purpose?
            public let referenceName: String
            public var territorySchedules: [TerritorySchedules]?

            public init(badge: AppEvent.Attributes.Badge? = nil, deepLink: String? = nil, primaryLocale: String? = nil, priority: AppEvent.Attributes.Priority? = nil, purchaseRequirement: AppEvent.Attributes.PurchaseRequirement? = nil, purpose: AppEvent.Attributes.Purpose? = nil, referenceName: String, territorySchedules: [TerritorySchedules]? = nil) {
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

                public init(eventEnd: Date? = nil, eventStart: Date? = nil, publishStart: Date? = nil, territories: [String]? = nil) {
                    self.eventEnd = eventEnd
                    self.eventStart = eventStart
                    self.publishStart = publishStart
                    self.territories = territories
                }
            }
        }

        /**
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appeventcreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let app: App

            public init(app: App) {
                self.app = app
            }

            public struct App: Codable {
                /// The type and ID of the resource that you're relating with the resource you're creating.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appeventcreaterequest/data/relationships/app/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "apps" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: CodingKeys.self)
                        id = try container.decode(String.self, forKey: .id)
                        if try container.decode(String.self, forKey: .type) != type {
                            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: CodingKeys.self)
                        try container.encode(id, forKey: .id)
                        try container.encode(type, forKey: .type)
                    }

                    private enum CodingKeys: String, CodingKey {
                        case id
                        case type
                    }
                }
            }
        }
    }
}
