import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # SubscriptionImagesResponse
 A response that contains a list of subscription image resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionimagesresponse>
 */
public struct SubscriptionImagesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = SubscriptionImage

    public let data: [SubscriptionImage]
    public var included: [Subscription]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [SubscriptionImage],
                included: [Subscription]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([SubscriptionImage].self, forKey: "data")
        included = try container.decodeIfPresent([Subscription].self, forKey: "included")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }

    public func getSubscription(for subscriptionImage: SubscriptionImage) -> Subscription? {
        included?.first { $0.id == subscriptionImage.relationships?.subscription?.data?.id }
    }
}
