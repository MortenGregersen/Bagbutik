import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionKey
 The data structure that represents an alternative distribution key resource.

 For more information about the response that includes this alternative distribution key object, see ``AlternativeDistributionKeyResponse``.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionkey>
 */
public struct AlternativeDistributionKey: Codable, Identifiable {
    /// An opaque resource ID that uniquely identifies the alternative distribution key.
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "alternativeDistributionKeys" }
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case type
    }

    /**
     # AlternativeDistributionKey.Attributes
     Attributes that describe an alternative distribution key resource.

     For more information on the object that includes these attributes, see ``AlternativeDistributionKey``.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionkey/attributes>
     */
    public struct Attributes: Codable {
        /// You create this key to establish a marketplace or web distribution app in App Store Connect. To learn more, see [Creating keys and establishing alternative marketplace connections](https://developer.apple.com/documentation/appstoreconnectapi/alternative_marketplaces_and_web_distribution/alternative_distribution_keys/creating_keys_and_establishing_alternative_marketplace_connections) or [Creating and configuring keys for web distribution](https://developer.apple.com/documentation/appstoreconnectapi/alternative_marketplaces_and_web_distribution/alternative_distribution_keys/creating_and_configuring_keys_for_web_distribution).
        public var publicKey: String?

        public init(publicKey: String? = nil) {
            self.publicKey = publicKey
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            publicKey = try container.decodeIfPresent(String.self, forKey: .publicKey)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(publicKey, forKey: .publicKey)
        }

        private enum CodingKeys: String, CodingKey {
            case publicKey
        }
    }
}
