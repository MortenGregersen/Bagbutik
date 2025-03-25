import Bagbutik_Core
import Bagbutik_Models
import Foundation

public struct SubscriptionOfferCodeCustomCodesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = SubscriptionOfferCodeCustomCode

    public let data: [SubscriptionOfferCodeCustomCode]
    public var included: [SubscriptionOfferCode]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [SubscriptionOfferCodeCustomCode],
                included: [SubscriptionOfferCode]? = nil,
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
        data = try container.decode([SubscriptionOfferCodeCustomCode].self, forKey: "data")
        included = try container.decodeIfPresent([SubscriptionOfferCode].self, forKey: "included")
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

    public func getOfferCode(for subscriptionOfferCodeCustomCode: SubscriptionOfferCodeCustomCode) -> SubscriptionOfferCode? {
        included?.first { $0.id == subscriptionOfferCodeCustomCode.relationships?.offerCode?.data?.id }
    }
}
