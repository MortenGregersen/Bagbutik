import Foundation

public struct SubscriptionOfferCodeResponse: Codable {
    public let data: SubscriptionOfferCode
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: SubscriptionOfferCode,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public func getCustomCodes() -> [SubscriptionOfferCodeCustomCode] {
        guard let customCodeIds = data.relationships?.customCodes?.data?.map(\.id),
              let customCodes = included?.compactMap({ relationship -> SubscriptionOfferCodeCustomCode? in
                  guard case let .subscriptionOfferCodeCustomCode(customCode) = relationship else { return nil }
                  return customCodeIds.contains(customCode.id) ? customCode : nil
              })
        else {
            return []
        }
        return customCodes
    }

    public func getOneTimeUseCodes() -> [SubscriptionOfferCodeOneTimeUseCode] {
        guard let oneTimeUseCodeIds = data.relationships?.oneTimeUseCodes?.data?.map(\.id),
              let oneTimeUseCodes = included?.compactMap({ relationship -> SubscriptionOfferCodeOneTimeUseCode? in
                  guard case let .subscriptionOfferCodeOneTimeUseCode(oneTimeUseCode) = relationship else { return nil }
                  return oneTimeUseCodeIds.contains(oneTimeUseCode.id) ? oneTimeUseCode : nil
              })
        else {
            return []
        }
        return oneTimeUseCodes
    }

    public func getPrices() -> [SubscriptionOfferCodePrice] {
        guard let priceIds = data.relationships?.prices?.data?.map(\.id),
              let prices = included?.compactMap({ relationship -> SubscriptionOfferCodePrice? in
                  guard case let .subscriptionOfferCodePrice(price) = relationship else { return nil }
                  return priceIds.contains(price.id) ? price : nil
              })
        else {
            return []
        }
        return prices
    }

    public func getSubscription() -> Subscription? {
        included?.compactMap { relationship -> Subscription? in
            guard case let .subscription(subscription) = relationship else { return nil }
            return subscription
        }.first { $0.id == data.relationships?.subscription?.data?.id }
    }

    public enum Included: Codable {
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

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
