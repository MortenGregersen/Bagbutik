import Bagbutik_Core
import Foundation

/**
 # MarketplaceWebhookUpdateRequest
 The request body you use to update a marketplace webhook url.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/marketplacewebhookupdaterequest>
 */
public struct MarketplaceWebhookUpdateRequest: Codable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     # MarketplaceWebhookUpdateRequest.Data
     The data structure that represent a marketplace webhook resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/marketplacewebhookupdaterequest/data>
     */
    public struct Data: Codable, Identifiable {
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
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(attributes, forKey: .attributes)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case id
            case type
        }

        /**
         # MarketplaceWebhookUpdateRequest.Data.Attributes
         Attributes that describe a marketplace webhook resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/marketplacewebhookupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public var endpointUrl: String?
            public var secret: String?

            public init(endpointUrl: String? = nil,
                        secret: String? = nil)
            {
                self.endpointUrl = endpointUrl
                self.secret = secret
            }
        }
    }
}
