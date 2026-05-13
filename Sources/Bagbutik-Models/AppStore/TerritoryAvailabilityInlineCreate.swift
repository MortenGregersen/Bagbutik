import Bagbutik_Core
import Foundation

/**
 # TerritoryAvailabilityInlineCreate
 The request body you use to create a territory availability.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/territoryavailabilityinlinecreate>
 */
public struct TerritoryAvailabilityInlineCreate: Codable, Sendable, Identifiable {
    public var id: String?
    public var type: String { "territoryAvailabilities" }
    public var attributes: Attributes?
    public var relationships: Relationships?

    public init(id: String? = nil,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decodeIfPresent(String.self, forKey: "id")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(id, forKey: "id")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    public struct Attributes: Codable, Sendable {
        public var available: Bool?
        public var preOrderEnabled: Bool?
        public var releaseDate: String?

        public init(available: Bool? = nil,
                    preOrderEnabled: Bool? = nil,
                    releaseDate: String? = nil)
        {
            self.available = available
            self.preOrderEnabled = preOrderEnabled
            self.releaseDate = releaseDate
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            available = try container.decodeIfPresent(Bool.self, forKey: "available")
            preOrderEnabled = try container.decodeIfPresent(Bool.self, forKey: "preOrderEnabled")
            releaseDate = try container.decodeIfPresent(String.self, forKey: "releaseDate")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(available, forKey: "available")
            try container.encodeIfPresent(preOrderEnabled, forKey: "preOrderEnabled")
            try container.encodeIfPresent(releaseDate, forKey: "releaseDate")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var territory: Territory?

        public init(territory: Territory? = nil) {
            self.territory = territory
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            territory = try container.decodeIfPresent(Territory.self, forKey: "territory")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(territory, forKey: "territory")
        }

        public struct Territory: Codable, Sendable {
            @NullCodable public var data: Data?

            public init(data: Data? = nil) {
                self.data = data
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "territories" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    id = try container.decode(String.self, forKey: "id")
                    if try container.decode(String.self, forKey: "type") != type {
                        throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(id, forKey: "id")
                    try container.encode(type, forKey: "type")
                }
            }
        }
    }
}
