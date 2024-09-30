import Bagbutik_Core
import Foundation

public struct SubscriptionsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = Subscription

    public let data: [Subscription]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [Subscription],
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
        data = try container.decode([Subscription].self, forKey: "data")
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

    public func getAppStoreReviewScreenshot(for subscription: Subscription) -> SubscriptionAppStoreReviewScreenshot? {
        included?.compactMap { relationship -> SubscriptionAppStoreReviewScreenshot? in
            guard case let .subscriptionAppStoreReviewScreenshot(appStoreReviewScreenshot) = relationship else { return nil }
            return appStoreReviewScreenshot
        }.first { $0.id == subscription.relationships?.appStoreReviewScreenshot?.data?.id }
    }

    public func getGroup(for subscription: Subscription) -> SubscriptionGroup? {
        included?.compactMap { relationship -> SubscriptionGroup? in
            guard case let .subscriptionGroup(group) = relationship else { return nil }
            return group
        }.first { $0.id == subscription.relationships?.group?.data?.id }
    }

    public func getIntroductoryOffers(for subscription: Subscription) -> [SubscriptionIntroductoryOffer] {
        guard let introductoryOfferIds = subscription.relationships?.introductoryOffers?.data?.map(\.id),
              let introductoryOffers = included?.compactMap({ relationship -> SubscriptionIntroductoryOffer? in
                  guard case let .subscriptionIntroductoryOffer(introductoryOffer) = relationship else { return nil }
                  return introductoryOfferIds.contains(introductoryOffer.id) ? introductoryOffer : nil
              })
        else {
            return []
        }
        return introductoryOffers
    }

    public func getOfferCodes(for subscription: Subscription) -> [SubscriptionOfferCode] {
        guard let offerCodeIds = subscription.relationships?.offerCodes?.data?.map(\.id),
              let offerCodes = included?.compactMap({ relationship -> SubscriptionOfferCode? in
                  guard case let .subscriptionOfferCode(offerCode) = relationship else { return nil }
                  return offerCodeIds.contains(offerCode.id) ? offerCode : nil
              })
        else {
            return []
        }
        return offerCodes
    }

    public func getPrices(for subscription: Subscription) -> [SubscriptionPrice] {
        guard let priceIds = subscription.relationships?.prices?.data?.map(\.id),
              let prices = included?.compactMap({ relationship -> SubscriptionPrice? in
                  guard case let .subscriptionPrice(price) = relationship else { return nil }
                  return priceIds.contains(price.id) ? price : nil
              })
        else {
            return []
        }
        return prices
    }

    public func getPromotedPurchase(for subscription: Subscription) -> PromotedPurchase? {
        included?.compactMap { relationship -> PromotedPurchase? in
            guard case let .promotedPurchase(promotedPurchase) = relationship else { return nil }
            return promotedPurchase
        }.first { $0.id == subscription.relationships?.promotedPurchase?.data?.id }
    }

    public func getPromotionalOffers(for subscription: Subscription) -> [SubscriptionPromotionalOffer] {
        guard let promotionalOfferIds = subscription.relationships?.promotionalOffers?.data?.map(\.id),
              let promotionalOffers = included?.compactMap({ relationship -> SubscriptionPromotionalOffer? in
                  guard case let .subscriptionPromotionalOffer(promotionalOffer) = relationship else { return nil }
                  return promotionalOfferIds.contains(promotionalOffer.id) ? promotionalOffer : nil
              })
        else {
            return []
        }
        return promotionalOffers
    }

    public func getSubscriptionAvailability(for subscription: Subscription) -> SubscriptionAvailability? {
        included?.compactMap { relationship -> SubscriptionAvailability? in
            guard case let .subscriptionAvailability(subscriptionAvailability) = relationship else { return nil }
            return subscriptionAvailability
        }.first { $0.id == subscription.relationships?.subscriptionAvailability?.data?.id }
    }

    public func getSubscriptionLocalizations(for subscription: Subscription) -> [SubscriptionLocalization] {
        guard let subscriptionLocalizationIds = subscription.relationships?.subscriptionLocalizations?.data?.map(\.id),
              let subscriptionLocalizations = included?.compactMap({ relationship -> SubscriptionLocalization? in
                  guard case let .subscriptionLocalization(subscriptionLocalization) = relationship else { return nil }
                  return subscriptionLocalizationIds.contains(subscriptionLocalization.id) ? subscriptionLocalization : nil
              })
        else {
            return []
        }
        return subscriptionLocalizations
    }

    public enum Included: Codable, Sendable {
        case promotedPurchase(PromotedPurchase)
        case subscriptionAppStoreReviewScreenshot(SubscriptionAppStoreReviewScreenshot)
        case subscriptionAvailability(SubscriptionAvailability)
        case subscriptionGroup(SubscriptionGroup)
        case subscriptionIntroductoryOffer(SubscriptionIntroductoryOffer)
        case subscriptionLocalization(SubscriptionLocalization)
        case subscriptionOfferCode(SubscriptionOfferCode)
        case subscriptionPrice(SubscriptionPrice)
        case subscriptionPromotionalOffer(SubscriptionPromotionalOffer)

        public init(from decoder: Decoder) throws {
            if let promotedPurchase = try? PromotedPurchase(from: decoder) {
                self = .promotedPurchase(promotedPurchase)
            } else if let subscriptionAppStoreReviewScreenshot = try? SubscriptionAppStoreReviewScreenshot(from: decoder) {
                self = .subscriptionAppStoreReviewScreenshot(subscriptionAppStoreReviewScreenshot)
            } else if let subscriptionAvailability = try? SubscriptionAvailability(from: decoder) {
                self = .subscriptionAvailability(subscriptionAvailability)
            } else if let subscriptionGroup = try? SubscriptionGroup(from: decoder) {
                self = .subscriptionGroup(subscriptionGroup)
            } else if let subscriptionIntroductoryOffer = try? SubscriptionIntroductoryOffer(from: decoder) {
                self = .subscriptionIntroductoryOffer(subscriptionIntroductoryOffer)
            } else if let subscriptionLocalization = try? SubscriptionLocalization(from: decoder) {
                self = .subscriptionLocalization(subscriptionLocalization)
            } else if let subscriptionOfferCode = try? SubscriptionOfferCode(from: decoder) {
                self = .subscriptionOfferCode(subscriptionOfferCode)
            } else if let subscriptionPrice = try? SubscriptionPrice(from: decoder) {
                self = .subscriptionPrice(subscriptionPrice)
            } else if let subscriptionPromotionalOffer = try? SubscriptionPromotionalOffer(from: decoder) {
                self = .subscriptionPromotionalOffer(subscriptionPromotionalOffer)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .promotedPurchase(value):
                try value.encode(to: encoder)
            case let .subscriptionAppStoreReviewScreenshot(value):
                try value.encode(to: encoder)
            case let .subscriptionAvailability(value):
                try value.encode(to: encoder)
            case let .subscriptionGroup(value):
                try value.encode(to: encoder)
            case let .subscriptionIntroductoryOffer(value):
                try value.encode(to: encoder)
            case let .subscriptionLocalization(value):
                try value.encode(to: encoder)
            case let .subscriptionOfferCode(value):
                try value.encode(to: encoder)
            case let .subscriptionPrice(value):
                try value.encode(to: encoder)
            case let .subscriptionPromotionalOffer(value):
                try value.encode(to: encoder)
            }
        }
    }
}
