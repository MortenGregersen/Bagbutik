import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # MarketplaceWebhookUpdateRequest
 The request body you use to update a marketplace webhook url.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/marketplacewebhookupdaterequest>
 */
public struct MarketplaceWebhookUpdateRequest: Codable, Sendable, RequestBody {
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
        public var type: String { "marketplaceWebhooks" }
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
            public var endpointUrl: String?
            public var secret: String?

            public init(endpointUrl: String? = nil,
                        secret: String? = nil)
            {
                self.endpointUrl = endpointUrl
                self.secret = secret
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                endpointUrl = try container.decodeIfPresent(String.self, forKey: "endpointUrl")
                secret = try container.decodeIfPresent(String.self, forKey: "secret")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(endpointUrl, forKey: "endpointUrl")
                try container.encodeIfPresent(secret, forKey: "secret")
            }
        }
    }
}
