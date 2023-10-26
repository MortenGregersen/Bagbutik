import Bagbutik_Core
import Foundation

/**
 # EndAppAvailabilityPreOrder
 The data structure that represents the ending of an app preorder resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/endappavailabilitypreorder>
 */
public struct EndAppAvailabilityPreOrder: Codable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "endAppAvailabilityPreOrders" }

    public init(id: String,
                links: ResourceLinks? = nil)
    {
        self.id = id
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: .links)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(links, forKey: .links)
        try container.encode(type, forKey: .type)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case links
        case type
    }
}
