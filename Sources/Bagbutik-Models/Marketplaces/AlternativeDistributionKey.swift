import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionKey
 The data structure that represents an alternative distribution key resource.

 For more information about the response that includes this alternative distribution key object, see [AlternativeDistributionKeyResponse](https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionkeyresponse).

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionkey>
 */
public struct AlternativeDistributionKey: Codable, Sendable, Identifiable {
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

    public struct Attributes: Codable, Sendable {
        public var publicKey: String?

        public init(publicKey: String? = nil) {
            self.publicKey = publicKey
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            publicKey = try container.decodeIfPresent(String.self, forKey: "publicKey")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(publicKey, forKey: "publicKey")
        }
    }
}
