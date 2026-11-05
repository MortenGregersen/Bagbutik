import BagbutikCore
import Foundation

/**
 # RetentionOffersResponse

 The response body for endpoints that list retention offers.

 ```
 object RetentionOffersResponse
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/retentionoffersresponse>
 */
public struct RetentionOffersResponse: Codable, Sendable, PagedResponse {
    public typealias Data = RetentionOffer

    public let data: [RetentionOffer]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [RetentionOffer],
                included: [Included]? = nil,
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
        data = try container.decode([RetentionOffer].self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
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

    public func getPrices(for retentionOffer: RetentionOffer) -> [RetentionOfferPrice] {
        guard let priceIds = retentionOffer.relationships?.prices?.data?.map(\.id),
              let prices = included?.compactMap({ relationship -> RetentionOfferPrice? in
                  guard case let .retentionOfferPrice(price) = relationship else { return nil }
                  return priceIds.contains(price.id) ? price : nil
              })
        else {
            return []
        }
        return prices
    }

    public func getSubscription(for retentionOffer: RetentionOffer) -> Subscription? {
        included?.compactMap { relationship -> Subscription? in
            guard case let .subscription(subscription) = relationship else { return nil }
            return subscription
        }.first { $0.id == retentionOffer.relationships?.subscription?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case retentionOfferPrice(RetentionOfferPrice)
        case subscription(Subscription)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "retentionOfferPrices":
                self = .retentionOfferPrice(try RetentionOfferPrice(from: decoder))
            case "subscriptions":
                self = .subscription(try Subscription(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .retentionOfferPrice(value):
                try value.encode(to: encoder)
            case let .subscription(value):
                try value.encode(to: encoder)
            }
        }
    }
}
