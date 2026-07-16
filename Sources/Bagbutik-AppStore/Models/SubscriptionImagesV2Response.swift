import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # SubscriptionImagesV2Response
 The response body for endpoints that list subscription images configured with the v2 API.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionimagesv2response>
 */
public struct SubscriptionImagesV2Response: Codable, Sendable, PagedResponse {
    public typealias Data = SubscriptionImageV2

    public let data: [SubscriptionImageV2]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [SubscriptionImageV2],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([SubscriptionImageV2].self, forKey: "data")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }
}
