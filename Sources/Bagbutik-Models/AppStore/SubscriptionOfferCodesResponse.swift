import Bagbutik_Core
import Foundation

public struct SubscriptionOfferCodesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = SubscriptionOfferCode

    public let data: [SubscriptionOfferCode]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [SubscriptionOfferCode],
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
        data = try container.decode([SubscriptionOfferCode].self, forKey: "data")
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

    public func getCustomCodes(for subscriptionOfferCode: SubscriptionOfferCode) -> [SubscriptionOfferCodeCustomCode] {
        guard let customCodeIds = subscriptionOfferCode.relationships?.customCodes?.data?.map(\.id),
              let customCodes = included?.compactMap({ relationship -> SubscriptionOfferCodeCustomCode? in
                  guard case let .subscriptionOfferCodeCustomCode(customCode) = relationship else { return nil }
                  return customCodeIds.contains(customCode.id) ? customCode : nil
              })
        else {
            return []
        }
        return customCodes
    }

    public func getOneTimeUseCodes(for subscriptionOfferCode: SubscriptionOfferCode) -> [SubscriptionOfferCodeOneTimeUseCode] {
        guard let oneTimeUseCodeIds = subscriptionOfferCode.relationships?.oneTimeUseCodes?.data?.map(\.id),
              let oneTimeUseCodes = included?.compactMap({ relationship -> SubscriptionOfferCodeOneTimeUseCode? in
                  guard case let .subscriptionOfferCodeOneTimeUseCode(oneTimeUseCode) = relationship else { return nil }
                  return oneTimeUseCodeIds.contains(oneTimeUseCode.id) ? oneTimeUseCode : nil
              })
        else {
            return []
        }
        return oneTimeUseCodes
    }

    public func getPrices(for subscriptionOfferCode: SubscriptionOfferCode) -> [SubscriptionOfferCodePrice] {
        guard let priceIds = subscriptionOfferCode.relationships?.prices?.data?.map(\.id),
              let prices = included?.compactMap({ relationship -> SubscriptionOfferCodePrice? in
                  guard case let .subscriptionOfferCodePrice(price) = relationship else { return nil }
                  return priceIds.contains(price.id) ? price : nil
              })
        else {
            return []
        }
        return prices
    }

    public func getSubscription(for subscriptionOfferCode: SubscriptionOfferCode) -> Subscription? {
        included?.compactMap { relationship -> Subscription? in
            guard case let .subscription(subscription) = relationship else { return nil }
            return subscription
        }.first { $0.id == subscriptionOfferCode.relationships?.subscription?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case subscription(Subscription)
        case subscriptionOfferCodeCustomCode(SubscriptionOfferCodeCustomCode)
        case subscriptionOfferCodeOneTimeUseCode(SubscriptionOfferCodeOneTimeUseCode)
        case subscriptionOfferCodePrice(SubscriptionOfferCodePrice)

        public init(from decoder: Decoder) throws {
            if let subscription = try? Subscription(from: decoder) {
                self = .subscription(subscription)
            } else if let subscriptionOfferCodeCustomCode = try? SubscriptionOfferCodeCustomCode(from: decoder) {
                self = .subscriptionOfferCodeCustomCode(subscriptionOfferCodeCustomCode)
            } else if let subscriptionOfferCodeOneTimeUseCode = try? SubscriptionOfferCodeOneTimeUseCode(from: decoder) {
                self = .subscriptionOfferCodeOneTimeUseCode(subscriptionOfferCodeOneTimeUseCode)
            } else if let subscriptionOfferCodePrice = try? SubscriptionOfferCodePrice(from: decoder) {
                self = .subscriptionOfferCodePrice(subscriptionOfferCodePrice)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .subscription(value):
                try value.encode(to: encoder)
            case let .subscriptionOfferCodeCustomCode(value):
                try value.encode(to: encoder)
            case let .subscriptionOfferCodeOneTimeUseCode(value):
                try value.encode(to: encoder)
            case let .subscriptionOfferCodePrice(value):
                try value.encode(to: encoder)
            }
        }
    }
}
