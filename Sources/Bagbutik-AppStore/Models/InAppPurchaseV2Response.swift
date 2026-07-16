import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # InAppPurchaseV2Response
 A response containing a single in-app purchase configured via the v2 API.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchasev2response>
 */
public struct InAppPurchaseV2Response: Codable, Sendable {
    public let data: InAppPurchaseV2
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: InAppPurchaseV2,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(InAppPurchaseV2.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getAppStoreReviewScreenshot() -> InAppPurchaseAppStoreReviewScreenshot? {
        included?.compactMap { relationship -> InAppPurchaseAppStoreReviewScreenshot? in
            guard case let .inAppPurchaseAppStoreReviewScreenshot(appStoreReviewScreenshot) = relationship else { return nil }
            return appStoreReviewScreenshot
        }.first { $0.id == data.relationships?.appStoreReviewScreenshot?.data?.id }
    }

    public func getContent() -> InAppPurchaseContent? {
        included?.compactMap { relationship -> InAppPurchaseContent? in
            guard case let .inAppPurchaseContent(content) = relationship else { return nil }
            return content
        }.first { $0.id == data.relationships?.content?.data?.id }
    }

    public func getIapPriceSchedule() -> InAppPurchasePriceSchedule? {
        included?.compactMap { relationship -> InAppPurchasePriceSchedule? in
            guard case let .inAppPurchasePriceSchedule(iapPriceSchedule) = relationship else { return nil }
            return iapPriceSchedule
        }.first { $0.id == data.relationships?.iapPriceSchedule?.data?.id }
    }

    public func getImages() -> [InAppPurchaseImage] {
        guard let imageIds = data.relationships?.images?.data?.map(\.id),
              let images = included?.compactMap({ relationship -> InAppPurchaseImage? in
                  guard case let .inAppPurchaseImage(image) = relationship else { return nil }
                  return imageIds.contains(image.id) ? image : nil
              })
        else {
            return []
        }
        return images
    }

    public func getInAppPurchaseAvailability() -> InAppPurchaseAvailability? {
        included?.compactMap { relationship -> InAppPurchaseAvailability? in
            guard case let .inAppPurchaseAvailability(inAppPurchaseAvailability) = relationship else { return nil }
            return inAppPurchaseAvailability
        }.first { $0.id == data.relationships?.inAppPurchaseAvailability?.data?.id }
    }

    public func getInAppPurchaseLocalizations() -> [InAppPurchaseLocalization] {
        guard let inAppPurchaseLocalizationIds = data.relationships?.inAppPurchaseLocalizations?.data?.map(\.id),
              let inAppPurchaseLocalizations = included?.compactMap({ relationship -> InAppPurchaseLocalization? in
                  guard case let .inAppPurchaseLocalization(inAppPurchaseLocalization) = relationship else { return nil }
                  return inAppPurchaseLocalizationIds.contains(inAppPurchaseLocalization.id) ? inAppPurchaseLocalization : nil
              })
        else {
            return []
        }
        return inAppPurchaseLocalizations
    }

    public func getOfferCodes() -> [InAppPurchaseOfferCode] {
        guard let offerCodeIds = data.relationships?.offerCodes?.data?.map(\.id),
              let offerCodes = included?.compactMap({ relationship -> InAppPurchaseOfferCode? in
                  guard case let .inAppPurchaseOfferCode(offerCode) = relationship else { return nil }
                  return offerCodeIds.contains(offerCode.id) ? offerCode : nil
              })
        else {
            return []
        }
        return offerCodes
    }

    public func getPricePoints() -> [InAppPurchasePricePoint] {
        guard let pricePointIds = data.relationships?.pricePoints?.data?.map(\.id),
              let pricePoints = included?.compactMap({ relationship -> InAppPurchasePricePoint? in
                  guard case let .inAppPurchasePricePoint(pricePoint) = relationship else { return nil }
                  return pricePointIds.contains(pricePoint.id) ? pricePoint : nil
              })
        else {
            return []
        }
        return pricePoints
    }

    public func getPromotedPurchase() -> PromotedPurchase? {
        included?.compactMap { relationship -> PromotedPurchase? in
            guard case let .promotedPurchase(promotedPurchase) = relationship else { return nil }
            return promotedPurchase
        }.first { $0.id == data.relationships?.promotedPurchase?.data?.id }
    }

    public func getVersions() -> [InAppPurchaseVersion] {
        guard let versionIds = data.relationships?.versions?.data?.map(\.id),
              let versions = included?.compactMap({ relationship -> InAppPurchaseVersion? in
                  guard case let .inAppPurchaseVersion(version) = relationship else { return nil }
                  return versionIds.contains(version.id) ? version : nil
              })
        else {
            return []
        }
        return versions
    }

    public enum Included: Codable, Sendable {
        case inAppPurchaseAppStoreReviewScreenshot(InAppPurchaseAppStoreReviewScreenshot)
        case inAppPurchaseAvailability(InAppPurchaseAvailability)
        case inAppPurchaseContent(InAppPurchaseContent)
        case inAppPurchaseImage(InAppPurchaseImage)
        case inAppPurchaseLocalization(InAppPurchaseLocalization)
        case inAppPurchaseOfferCode(InAppPurchaseOfferCode)
        case inAppPurchasePricePoint(InAppPurchasePricePoint)
        case inAppPurchasePriceSchedule(InAppPurchasePriceSchedule)
        case inAppPurchaseVersion(InAppPurchaseVersion)
        case promotedPurchase(PromotedPurchase)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "inAppPurchaseAppStoreReviewScreenshots":
                self = .inAppPurchaseAppStoreReviewScreenshot(try InAppPurchaseAppStoreReviewScreenshot(from: decoder))
            case "inAppPurchaseAvailabilities":
                self = .inAppPurchaseAvailability(try InAppPurchaseAvailability(from: decoder))
            case "inAppPurchaseContents":
                self = .inAppPurchaseContent(try InAppPurchaseContent(from: decoder))
            case "inAppPurchaseImages":
                self = .inAppPurchaseImage(try InAppPurchaseImage(from: decoder))
            case "inAppPurchaseLocalizations":
                self = .inAppPurchaseLocalization(try InAppPurchaseLocalization(from: decoder))
            case "inAppPurchaseOfferCodes":
                self = .inAppPurchaseOfferCode(try InAppPurchaseOfferCode(from: decoder))
            case "inAppPurchasePricePoints":
                self = .inAppPurchasePricePoint(try InAppPurchasePricePoint(from: decoder))
            case "inAppPurchasePriceSchedules":
                self = .inAppPurchasePriceSchedule(try InAppPurchasePriceSchedule(from: decoder))
            case "inAppPurchaseVersions":
                self = .inAppPurchaseVersion(try InAppPurchaseVersion(from: decoder))
            case "promotedPurchases":
                self = .promotedPurchase(try PromotedPurchase(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .inAppPurchaseAppStoreReviewScreenshot(value):
                try value.encode(to: encoder)
            case let .inAppPurchaseAvailability(value):
                try value.encode(to: encoder)
            case let .inAppPurchaseContent(value):
                try value.encode(to: encoder)
            case let .inAppPurchaseImage(value):
                try value.encode(to: encoder)
            case let .inAppPurchaseLocalization(value):
                try value.encode(to: encoder)
            case let .inAppPurchaseOfferCode(value):
                try value.encode(to: encoder)
            case let .inAppPurchasePricePoint(value):
                try value.encode(to: encoder)
            case let .inAppPurchasePriceSchedule(value):
                try value.encode(to: encoder)
            case let .inAppPurchaseVersion(value):
                try value.encode(to: encoder)
            case let .promotedPurchase(value):
                try value.encode(to: encoder)
            }
        }
    }
}
