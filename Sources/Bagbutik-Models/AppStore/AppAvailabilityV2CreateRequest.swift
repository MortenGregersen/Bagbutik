import Bagbutik_Core
import Foundation

/**
 # AppAvailabilityV2CreateRequest
 The request body you use to create an app availability.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appavailabilityv2createrequest>
 */
public struct AppAvailabilityV2CreateRequest: Codable, RequestBody {
    public let data: Data
    public var included: [TerritoryAvailabilityInlineCreate]?

    public init(data: Data,
                included: [TerritoryAvailabilityInlineCreate]? = nil)
    {
        self.data = data
        self.included = included
    }

    public struct Data: Codable {
        public var type: String { "appAvailabilities" }
        public let attributes: Attributes
        public let relationships: Relationships

        public init(attributes: Attributes,
                    relationships: Relationships)
        {
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
            case attributes
            case relationships
            case type
        }

        public struct Attributes: Codable {
            public let availableInNewTerritories: Bool

            public init(availableInNewTerritories: Bool) {
                self.availableInNewTerritories = availableInNewTerritories
            }
        }

        public struct Relationships: Codable {
            public let app: App
            public let territoryAvailabilities: TerritoryAvailabilities

            public init(app: App,
                        territoryAvailabilities: TerritoryAvailabilities)
            {
                self.app = app
                self.territoryAvailabilities = territoryAvailabilities
            }

            public struct App: Codable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                public struct Data: Codable, Identifiable {
                    public let id: String
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

            public struct TerritoryAvailabilities: Codable {
                public let data: [Data]

                public init(data: [Data]) {
                    self.data = data
                }

                public struct Data: Codable, Identifiable {
                    public let id: String
                    public var type: String { "territoryAvailabilities" }

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
