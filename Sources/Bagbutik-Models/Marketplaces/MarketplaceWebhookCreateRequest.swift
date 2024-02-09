import Bagbutik_Core
import Foundation

/**
 # MarketplaceWebhookCreateRequest
 The request body you use to create a marketplace webhook url.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/marketplacewebhookcreaterequest>
 */
public struct MarketplaceWebhookCreateRequest: Codable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public struct Data: Codable {
        public var type: String { "marketplaceWebhooks" }
        public let attributes: Attributes

        public init(attributes: Attributes) {
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decode(Attributes.self, forKey: .attributes)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(attributes, forKey: .attributes)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case type
        }

        public struct Attributes: Codable {
            public let endpointUrl: String
            public let secret: String

            public init(endpointUrl: String,
                        secret: String)
            {
                self.endpointUrl = endpointUrl
                self.secret = secret
            }
        }
    }
}
