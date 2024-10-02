import Bagbutik_Core
import Foundation

public struct SubscriptionOfferCodeOneTimeUseCode: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "subscriptionOfferCodeOneTimeUseCodes" }
    public var attributes: Attributes?
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    public struct Attributes: Codable, Sendable {
        public var active: Bool?
        public var createdDate: Date?
        public var expirationDate: String?
        public var numberOfCodes: Int?

        public init(active: Bool? = nil,
                    createdDate: Date? = nil,
                    expirationDate: String? = nil,
                    numberOfCodes: Int? = nil)
        {
            self.active = active
            self.createdDate = createdDate
            self.expirationDate = expirationDate
            self.numberOfCodes = numberOfCodes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            active = try container.decodeIfPresent(Bool.self, forKey: "active")
            createdDate = try container.decodeIfPresent(Date.self, forKey: "createdDate")
            expirationDate = try container.decodeIfPresent(String.self, forKey: "expirationDate")
            numberOfCodes = try container.decodeIfPresent(Int.self, forKey: "numberOfCodes")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(active, forKey: "active")
            try container.encodeIfPresent(createdDate, forKey: "createdDate")
            try container.encodeIfPresent(expirationDate, forKey: "expirationDate")
            try container.encodeIfPresent(numberOfCodes, forKey: "numberOfCodes")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var offerCode: OfferCode?
        public var values: Values?

        public init(offerCode: OfferCode? = nil,
                    values: Values? = nil)
        {
            self.offerCode = offerCode
            self.values = values
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            offerCode = try container.decodeIfPresent(OfferCode.self, forKey: "offerCode")
            values = try container.decodeIfPresent(Values.self, forKey: "values")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(offerCode, forKey: "offerCode")
            try container.encodeIfPresent(values, forKey: "values")
        }

        public struct OfferCode: Codable, Sendable {
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
                public var type: String { "subscriptionOfferCodes" }

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

        public struct Values: Codable, Sendable {
            public var links: RelationshipLinks?

            public init(links: RelationshipLinks? = nil) {
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(links, forKey: "links")
            }
        }
    }
}
