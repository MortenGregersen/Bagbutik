import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # MerchantIdResponse
 A response that contains a single merchant ID resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/merchantidresponse>
 */
public struct MerchantIdResponse: Codable, Sendable {
    public let data: MerchantId
    public var included: [Certificate]?
    public let links: DocumentLinks

    public init(data: MerchantId,
                included: [Certificate]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(MerchantId.self, forKey: "data")
        included = try container.decodeIfPresent([Certificate].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
