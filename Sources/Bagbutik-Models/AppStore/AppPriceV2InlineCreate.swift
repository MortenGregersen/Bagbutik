import Bagbutik_Core
import Foundation

/**
 # AppPriceV2InlineCreate
 The data structure that represents a App Price V2 Inline Create resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppricev2inlinecreate>
 */
public struct AppPriceV2InlineCreate: Codable, Sendable, Identifiable {
    public var id: String?
    public var type: String { "appPrices" }
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
        public var endDate: String?
        public var startDate: String?

        public init(endDate: String? = nil,
                    startDate: String? = nil)
        {
            self.endDate = endDate
            self.startDate = startDate
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            endDate = try container.decodeIfPresent(String.self, forKey: "endDate")
            startDate = try container.decodeIfPresent(String.self, forKey: "startDate")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(endDate, forKey: "endDate")
            try container.encodeIfPresent(startDate, forKey: "startDate")
        }
    }

    public struct Relationships: Codable, Sendable {
        public let appPricePoint: AppPricePoint

        public init(appPricePoint: AppPricePoint) {
            self.appPricePoint = appPricePoint
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appPricePoint = try container.decode(AppPricePoint.self, forKey: "appPricePoint")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(appPricePoint, forKey: "appPricePoint")
        }

        public struct AppPricePoint: Codable, Sendable {
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
                public var type: String { "appPricePoints" }

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
