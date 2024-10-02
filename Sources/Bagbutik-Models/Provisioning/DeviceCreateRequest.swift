import Bagbutik_Core
import Foundation

public struct DeviceCreateRequest: Codable, Sendable, RequestBody {
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
        public var type: String { "devices" }
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
            public let name: String
            public let platform: BundleIdPlatform
            public let udid: String

            public init(name: String,
                        platform: BundleIdPlatform,
                        udid: String)
            {
                self.name = name
                self.platform = platform
                self.udid = udid
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                name = try container.decode(String.self, forKey: "name")
                platform = try container.decode(BundleIdPlatform.self, forKey: "platform")
                udid = try container.decode(String.self, forKey: "udid")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(name, forKey: "name")
                try container.encode(platform, forKey: "platform")
                try container.encode(udid, forKey: "udid")
            }
        }
    }
}
