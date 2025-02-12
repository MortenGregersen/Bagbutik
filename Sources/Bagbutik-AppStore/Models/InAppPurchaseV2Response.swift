import Bagbutik_Core
import Bagbutik_Models
import Foundation

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

    public enum Included: Codable, Sendable {
        case inAppPurchaseAppStoreReviewScreenshot(InAppPurchaseAppStoreReviewScreenshot)
        case inAppPurchaseAvailability(InAppPurchaseAvailability)
        case inAppPurchaseContent(InAppPurchaseContent)
        case inAppPurchaseImage(InAppPurchaseImage)
        case inAppPurchaseLocalization(InAppPurchaseLocalization)
        case inAppPurchasePricePoint(InAppPurchasePricePoint)
        case inAppPurchasePriceSchedule(InAppPurchasePriceSchedule)
        case promotedPurchase(PromotedPurchase)

        public init(from decoder: Decoder) throws {
            if let inAppPurchaseAppStoreReviewScreenshot = try? InAppPurchaseAppStoreReviewScreenshot(from: decoder) {
                self = .inAppPurchaseAppStoreReviewScreenshot(inAppPurchaseAppStoreReviewScreenshot)
            } else if let inAppPurchaseAvailability = try? InAppPurchaseAvailability(from: decoder) {
                self = .inAppPurchaseAvailability(inAppPurchaseAvailability)
            } else if let inAppPurchaseContent = try? InAppPurchaseContent(from: decoder) {
                self = .inAppPurchaseContent(inAppPurchaseContent)
            } else if let inAppPurchaseImage = try? InAppPurchaseImage(from: decoder) {
                self = .inAppPurchaseImage(inAppPurchaseImage)
            } else if let inAppPurchaseLocalization = try? InAppPurchaseLocalization(from: decoder) {
                self = .inAppPurchaseLocalization(inAppPurchaseLocalization)
            } else if let inAppPurchasePricePoint = try? InAppPurchasePricePoint(from: decoder) {
                self = .inAppPurchasePricePoint(inAppPurchasePricePoint)
            } else if let inAppPurchasePriceSchedule = try? InAppPurchasePriceSchedule(from: decoder) {
                self = .inAppPurchasePriceSchedule(inAppPurchasePriceSchedule)
            } else if let promotedPurchase = try? PromotedPurchase(from: decoder) {
                self = .promotedPurchase(promotedPurchase)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
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
            case let .inAppPurchasePricePoint(value):
                try value.encode(to: encoder)
            case let .inAppPurchasePriceSchedule(value):
                try value.encode(to: encoder)
            case let .promotedPurchase(value):
                try value.encode(to: encoder)
            }
        }
    }
}
