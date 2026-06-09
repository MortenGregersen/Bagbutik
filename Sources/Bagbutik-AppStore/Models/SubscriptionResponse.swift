import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # SubscriptionResponse
 The response body for endpoints that create, read, or modify a single auto-renewable subscription.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionresponse>
 */
public struct SubscriptionResponse: Codable, Sendable {
    public let data: Subscription
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: Subscription,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Subscription.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getAppStoreReviewScreenshot() -> SubscriptionAppStoreReviewScreenshot? {
        included?.compactMap { relationship -> SubscriptionAppStoreReviewScreenshot? in
            guard case let .subscriptionAppStoreReviewScreenshot(appStoreReviewScreenshot) = relationship else { return nil }
            return appStoreReviewScreenshot
        }.first { $0.id == data.relationships?.appStoreReviewScreenshot?.data?.id }
    }

    public func getGroup() -> SubscriptionGroup? {
        included?.compactMap { relationship -> SubscriptionGroup? in
            guard case let .subscriptionGroup(group) = relationship else { return nil }
            return group
        }.first { $0.id == data.relationships?.group?.data?.id }
    }

    public func getImages() -> [SubscriptionImage] {
        guard let imageIds = data.relationships?.images?.data?.map(\.id),
              let images = included?.compactMap({ relationship -> SubscriptionImage? in
                  guard case let .subscriptionImage(image) = relationship else { return nil }
                  return imageIds.contains(image.id) ? image : nil
              })
        else {
            return []
        }
        return images
    }

    public func getIntroductoryOffers() -> [SubscriptionIntroductoryOffer] {
        guard let introductoryOfferIds = data.relationships?.introductoryOffers?.data?.map(\.id),
              let introductoryOffers = included?.compactMap({ relationship -> SubscriptionIntroductoryOffer? in
                  guard case let .subscriptionIntroductoryOffer(introductoryOffer) = relationship else { return nil }
                  return introductoryOfferIds.contains(introductoryOffer.id) ? introductoryOffer : nil
              })
        else {
            return []
        }
        return introductoryOffers
    }

    public func getOfferCodes() -> [SubscriptionOfferCode] {
        guard let offerCodeIds = data.relationships?.offerCodes?.data?.map(\.id),
              let offerCodes = included?.compactMap({ relationship -> SubscriptionOfferCode? in
                  guard case let .subscriptionOfferCode(offerCode) = relationship else { return nil }
                  return offerCodeIds.contains(offerCode.id) ? offerCode : nil
              })
        else {
            return []
        }
        return offerCodes
    }

    public func getPlanAvailabilities() -> [SubscriptionPlanAvailability] {
        guard let planAvailabilityIds = data.relationships?.planAvailabilities?.data?.map(\.id),
              let planAvailabilities = included?.compactMap({ relationship -> SubscriptionPlanAvailability? in
                  guard case let .subscriptionPlanAvailability(planAvailability) = relationship else { return nil }
                  return planAvailabilityIds.contains(planAvailability.id) ? planAvailability : nil
              })
        else {
            return []
        }
        return planAvailabilities
    }

    public func getPrices() -> [SubscriptionPrice] {
        guard let priceIds = data.relationships?.prices?.data?.map(\.id),
              let prices = included?.compactMap({ relationship -> SubscriptionPrice? in
                  guard case let .subscriptionPrice(price) = relationship else { return nil }
                  return priceIds.contains(price.id) ? price : nil
              })
        else {
            return []
        }
        return prices
    }

    public func getPromotedPurchase() -> PromotedPurchase? {
        included?.compactMap { relationship -> PromotedPurchase? in
            guard case let .promotedPurchase(promotedPurchase) = relationship else { return nil }
            return promotedPurchase
        }.first { $0.id == data.relationships?.promotedPurchase?.data?.id }
    }

    public func getPromotionalOffers() -> [SubscriptionPromotionalOffer] {
        guard let promotionalOfferIds = data.relationships?.promotionalOffers?.data?.map(\.id),
              let promotionalOffers = included?.compactMap({ relationship -> SubscriptionPromotionalOffer? in
                  guard case let .subscriptionPromotionalOffer(promotionalOffer) = relationship else { return nil }
                  return promotionalOfferIds.contains(promotionalOffer.id) ? promotionalOffer : nil
              })
        else {
            return []
        }
        return promotionalOffers
    }

    public func getSubscriptionLocalizations() -> [SubscriptionLocalization] {
        guard let subscriptionLocalizationIds = data.relationships?.subscriptionLocalizations?.data?.map(\.id),
              let subscriptionLocalizations = included?.compactMap({ relationship -> SubscriptionLocalization? in
                  guard case let .subscriptionLocalization(subscriptionLocalization) = relationship else { return nil }
                  return subscriptionLocalizationIds.contains(subscriptionLocalization.id) ? subscriptionLocalization : nil
              })
        else {
            return []
        }
        return subscriptionLocalizations
    }

    public func getWinBackOffers() -> [WinBackOffer] {
        guard let winBackOfferIds = data.relationships?.winBackOffers?.data?.map(\.id),
              let winBackOffers = included?.compactMap({ relationship -> WinBackOffer? in
                  guard case let .winBackOffer(winBackOffer) = relationship else { return nil }
                  return winBackOfferIds.contains(winBackOffer.id) ? winBackOffer : nil
              })
        else {
            return []
        }
        return winBackOffers
    }

    public enum Included: Codable, Sendable {
        case promotedPurchase(PromotedPurchase)
        case subscriptionAppStoreReviewScreenshot(SubscriptionAppStoreReviewScreenshot)
        case subscriptionAvailability(SubscriptionAvailability)
        case subscriptionGroup(SubscriptionGroup)
        case subscriptionImage(SubscriptionImage)
        case subscriptionIntroductoryOffer(SubscriptionIntroductoryOffer)
        case subscriptionLocalization(SubscriptionLocalization)
        case subscriptionOfferCode(SubscriptionOfferCode)
        case subscriptionPlanAvailability(SubscriptionPlanAvailability)
        case subscriptionPrice(SubscriptionPrice)
        case subscriptionPromotionalOffer(SubscriptionPromotionalOffer)
        case winBackOffer(WinBackOffer)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "promotedPurchases":
                self = .promotedPurchase(try PromotedPurchase(from: decoder))
            case "subscriptionAppStoreReviewScreenshots":
                self = .subscriptionAppStoreReviewScreenshot(try SubscriptionAppStoreReviewScreenshot(from: decoder))
            case "subscriptionAvailabilities":
                self = .subscriptionAvailability(try SubscriptionAvailability(from: decoder))
            case "subscriptionGroups":
                self = .subscriptionGroup(try SubscriptionGroup(from: decoder))
            case "subscriptionImages":
                self = .subscriptionImage(try SubscriptionImage(from: decoder))
            case "subscriptionIntroductoryOffers":
                self = .subscriptionIntroductoryOffer(try SubscriptionIntroductoryOffer(from: decoder))
            case "subscriptionLocalizations":
                self = .subscriptionLocalization(try SubscriptionLocalization(from: decoder))
            case "subscriptionOfferCodes":
                self = .subscriptionOfferCode(try SubscriptionOfferCode(from: decoder))
            case "subscriptionPlanAvailabilities":
                self = .subscriptionPlanAvailability(try SubscriptionPlanAvailability(from: decoder))
            case "subscriptionPrices":
                self = .subscriptionPrice(try SubscriptionPrice(from: decoder))
            case "subscriptionPromotionalOffers":
                self = .subscriptionPromotionalOffer(try SubscriptionPromotionalOffer(from: decoder))
            case "winBackOffers":
                self = .winBackOffer(try WinBackOffer(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
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
            case let .subscriptionImage(value):
                try value.encode(to: encoder)
            case let .subscriptionIntroductoryOffer(value):
                try value.encode(to: encoder)
            case let .subscriptionLocalization(value):
                try value.encode(to: encoder)
            case let .subscriptionOfferCode(value):
                try value.encode(to: encoder)
            case let .subscriptionPlanAvailability(value):
                try value.encode(to: encoder)
            case let .subscriptionPrice(value):
                try value.encode(to: encoder)
            case let .subscriptionPromotionalOffer(value):
                try value.encode(to: encoder)
            case let .winBackOffer(value):
                try value.encode(to: encoder)
            }
        }
    }
}
