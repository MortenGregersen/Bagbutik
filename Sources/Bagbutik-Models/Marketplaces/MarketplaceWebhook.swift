import Bagbutik_Core
import Foundation

/**
 # MarketplaceWebhook
 The data structure that represents a marketplace webhook resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/marketplacewebhook>
 */
public struct MarketplaceWebhook: Codable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "marketplaceWebhooks" }
    public var attributes: Attributes?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
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
    }

    /**
     # MarketplaceWebhook.Attributes
     The attribute that describes the url where you will recieve notifications.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/marketplacewebhook/attributes>
     */
    public struct Attributes: Codable {
        public var endpointUrl: String?

        public init(endpointUrl: String? = nil) {
            self.endpointUrl = endpointUrl
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            endpointUrl = try container.decodeIfPresent(String.self, forKey: "endpointUrl")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(endpointUrl, forKey: "endpointUrl")
        }
    }
}
