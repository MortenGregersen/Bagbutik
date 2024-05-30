import Bagbutik_Core
import Foundation

/**
 # Territory
 The data structure that represents a Territories resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/territory>
 */
public struct Territory: Codable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "territories" }
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
     # Territory.Attributes
     Attributes that describe a Territories resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/territory/attributes>
     */
    public struct Attributes: Codable {
        public var currency: String?

        public init(currency: String? = nil) {
            self.currency = currency
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            currency = try container.decodeIfPresent(String.self, forKey: .currency)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(currency, forKey: .currency)
        }

        private enum CodingKeys: String, CodingKey {
            case currency
        }
    }
}
