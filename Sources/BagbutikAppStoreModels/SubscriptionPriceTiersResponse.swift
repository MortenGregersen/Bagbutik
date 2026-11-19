import BagbutikCore
import Foundation

/**
 # SubscriptionPriceTiersResponse

 The response body for endpoints that list subscription price tiers.

 ```
 object SubscriptionPriceTiersResponse
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionpricetiersresponse>
 */
public struct SubscriptionPriceTiersResponse: Codable, Sendable, PagedResponse {
    public typealias Data = SubscriptionPriceTier

    public let data: [SubscriptionPriceTier]
    public var included: [SubscriptionPricePoint]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [SubscriptionPriceTier],
                included: [SubscriptionPricePoint]? = nil,
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
        data = try container.decode([SubscriptionPriceTier].self, forKey: "data")
        included = try container.decodeIfPresent([SubscriptionPricePoint].self, forKey: "included")
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

    public func getSubscriptionPricePoint(for subscriptionPriceTier: SubscriptionPriceTier) -> SubscriptionPricePoint? {
        included?.first { $0.id == subscriptionPriceTier.relationships?.subscriptionPricePoint?.data?.id }
    }
}
