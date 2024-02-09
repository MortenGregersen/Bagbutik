import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionKey
 The data structure that represents an alternative distribution key resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionkey>
 */
public struct AlternativeDistributionKey: Codable, Identifiable {
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

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionkey/attributes>
     */
    public struct Attributes: Codable {
        public var publicKey: String?

        public init(publicKey: String? = nil) {
            self.publicKey = publicKey
        }
    }
}
