import Bagbutik_Core
import Foundation

/**
 # InAppPurchaseOfferCodeOneTimeUseCode
 The data structure that represents an in-app purchase offer code one-time use code resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchaseoffercodeonetimeusecode>
 */
public struct InAppPurchaseOfferCodeOneTimeUseCode: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "inAppPurchaseOfferCodeOneTimeUseCodes" }
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
        public var environment: OfferCodeEnvironment?
        public var expirationDate: String?
        public var numberOfCodes: Int?

        public init(active: Bool? = nil,
                    createdDate: Date? = nil,
                    environment: OfferCodeEnvironment? = nil,
                    expirationDate: String? = nil,
                    numberOfCodes: Int? = nil)
        {
            self.active = active
            self.createdDate = createdDate
            self.environment = environment
            self.expirationDate = expirationDate
            self.numberOfCodes = numberOfCodes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            active = try container.decodeIfPresent(Bool.self, forKey: "active")
            createdDate = try container.decodeIfPresent(Date.self, forKey: "createdDate")
            environment = try container.decodeIfPresent(OfferCodeEnvironment.self, forKey: "environment")
            expirationDate = try container.decodeIfPresent(String.self, forKey: "expirationDate")
            numberOfCodes = try container.decodeIfPresent(Int.self, forKey: "numberOfCodes")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(active, forKey: "active")
            try container.encodeIfPresent(createdDate, forKey: "createdDate")
            try container.encodeIfPresent(environment, forKey: "environment")
            try container.encodeIfPresent(expirationDate, forKey: "expirationDate")
            try container.encodeIfPresent(numberOfCodes, forKey: "numberOfCodes")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var createdByActor: CreatedByActor?
        public var deactivatedByActor: DeactivatedByActor?
        public var values: Values?

        public init(createdByActor: CreatedByActor? = nil,
                    deactivatedByActor: DeactivatedByActor? = nil,
                    values: Values? = nil)
        {
            self.createdByActor = createdByActor
            self.deactivatedByActor = deactivatedByActor
            self.values = values
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            createdByActor = try container.decodeIfPresent(CreatedByActor.self, forKey: "createdByActor")
            deactivatedByActor = try container.decodeIfPresent(DeactivatedByActor.self, forKey: "deactivatedByActor")
            values = try container.decodeIfPresent(Values.self, forKey: "values")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(createdByActor, forKey: "createdByActor")
            try container.encodeIfPresent(deactivatedByActor, forKey: "deactivatedByActor")
            try container.encodeIfPresent(values, forKey: "values")
        }

        public struct CreatedByActor: Codable, Sendable {
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
                public var type: String { "actors" }

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

        public struct DeactivatedByActor: Codable, Sendable {
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
                public var type: String { "actors" }

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
