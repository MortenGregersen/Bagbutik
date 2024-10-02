import Bagbutik_Core
import Foundation

public struct BundleIdCreateRequest: Codable, Sendable, RequestBody {
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

    public struct Data: Codable, Sendable {
        public var type: String { "bundleIds" }
        public let attributes: Attributes

        public init(attributes: Attributes) {
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            attributes = try container.decode(Attributes.self, forKey: "attributes")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(type, forKey: "type")
            try container.encode(attributes, forKey: "attributes")
        }

        public struct Attributes: Codable, Sendable {
            public let identifier: String
            public let name: String
            public let platform: BundleIdPlatform
            public var seedId: String?

            public init(identifier: String,
                        name: String,
                        platform: BundleIdPlatform,
                        seedId: String? = nil)
            {
                self.identifier = identifier
                self.name = name
                self.platform = platform
                self.seedId = seedId
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                identifier = try container.decode(String.self, forKey: "identifier")
                name = try container.decode(String.self, forKey: "name")
                platform = try container.decode(BundleIdPlatform.self, forKey: "platform")
                seedId = try container.decodeIfPresent(String.self, forKey: "seedId")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(identifier, forKey: "identifier")
                try container.encode(name, forKey: "name")
                try container.encode(platform, forKey: "platform")
                try container.encodeIfPresent(seedId, forKey: "seedId")
            }
        }
    }
}
