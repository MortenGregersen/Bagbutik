import Bagbutik_Core
import Bagbutik_Models
import Foundation

public struct AppEventLocalizationUpdateRequest: Codable, Sendable, RequestBody {
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
        public var type: String { "appEventLocalizations" }
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
            public var longDescription: String?
            public var name: String?
            public var shortDescription: String?

            public init(longDescription: String? = nil,
                        name: String? = nil,
                        shortDescription: String? = nil)
            {
                self.longDescription = longDescription
                self.name = name
                self.shortDescription = shortDescription
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                longDescription = try container.decodeIfPresent(String.self, forKey: "longDescription")
                name = try container.decodeIfPresent(String.self, forKey: "name")
                shortDescription = try container.decodeIfPresent(String.self, forKey: "shortDescription")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(longDescription, forKey: "longDescription")
                try container.encodeIfPresent(name, forKey: "name")
                try container.encodeIfPresent(shortDescription, forKey: "shortDescription")
            }
        }
    }
}
