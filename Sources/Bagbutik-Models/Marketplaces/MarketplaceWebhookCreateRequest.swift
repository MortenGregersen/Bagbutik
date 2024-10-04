import Bagbutik_Core
import Foundation

/**
 # MarketplaceWebhookCreateRequest
 The request body you use to create a marketplace webhook url.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/marketplacewebhookcreaterequest>
 */
public struct MarketplaceWebhookCreateRequest: Codable, Sendable, RequestBody {
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
        public var type: String { "marketplaceWebhooks" }
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
            public let endpointUrl: String
            public let secret: String

            public init(endpointUrl: String,
                        secret: String)
            {
                self.endpointUrl = endpointUrl
                self.secret = secret
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                endpointUrl = try container.decode(String.self, forKey: "endpointUrl")
                secret = try container.decode(String.self, forKey: "secret")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(endpointUrl, forKey: "endpointUrl")
                try container.encode(secret, forKey: "secret")
            }
        }
    }
}
