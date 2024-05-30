import Bagbutik_Core
import Foundation

public struct InAppPurchasesV2Response: Codable, PagedResponse {
    public typealias Data = InAppPurchaseV2

    public let data: [InAppPurchaseV2]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [InAppPurchaseV2],
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode([InAppPurchaseV2].self, forKey: .data)
        included = try container.decodeIfPresent([Included].self, forKey: .included)
        links = try container.decode(PagedDocumentLinks.self, forKey: .links)
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encodeIfPresent(included, forKey: .included)
        try container.encode(links, forKey: .links)
        try container.encodeIfPresent(meta, forKey: .meta)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case included
        case links
        case meta
    }

    public func getAppStoreReviewScreenshot(for inAppPurchaseV2: InAppPurchaseV2) -> InAppPurchaseAppStoreReviewScreenshot? {
        included?.compactMap { relationship -> InAppPurchaseAppStoreReviewScreenshot? in
            guard case let .inAppPurchaseAppStoreReviewScreenshot(appStoreReviewScreenshot) = relationship else { return nil }
            return appStoreReviewScreenshot
        }.first { $0.id == inAppPurchaseV2.relationships?.appStoreReviewScreenshot?.data?.id }
    }

    public func getContent(for inAppPurchaseV2: InAppPurchaseV2) -> InAppPurchaseContent? {
        included?.compactMap { relationship -> InAppPurchaseContent? in
            guard case let .inAppPurchaseContent(content) = relationship else { return nil }
            return content
        }.first { $0.id == inAppPurchaseV2.relationships?.content?.data?.id }
    }

    public func getIapPriceSchedule(for inAppPurchaseV2: InAppPurchaseV2) -> InAppPurchasePriceSchedule? {
        included?.compactMap { relationship -> InAppPurchasePriceSchedule? in
            guard case let .inAppPurchasePriceSchedule(iapPriceSchedule) = relationship else { return nil }
            return iapPriceSchedule
        }.first { $0.id == inAppPurchaseV2.relationships?.iapPriceSchedule?.data?.id }
    }

    public func getInAppPurchaseAvailability(for inAppPurchaseV2: InAppPurchaseV2) -> InAppPurchaseAvailability? {
        included?.compactMap { relationship -> InAppPurchaseAvailability? in
            guard case let .inAppPurchaseAvailability(inAppPurchaseAvailability) = relationship else { return nil }
            return inAppPurchaseAvailability
        }.first { $0.id == inAppPurchaseV2.relationships?.inAppPurchaseAvailability?.data?.id }
    }

    public func getInAppPurchaseLocalizations(for inAppPurchaseV2: InAppPurchaseV2) -> [InAppPurchaseLocalization] {
        guard let inAppPurchaseLocalizationIds = inAppPurchaseV2.relationships?.inAppPurchaseLocalizations?.data?.map(\.id),
              let inAppPurchaseLocalizations = included?.compactMap({ relationship -> InAppPurchaseLocalization? in
                  guard case let .inAppPurchaseLocalization(inAppPurchaseLocalization) = relationship else { return nil }
                  return inAppPurchaseLocalizationIds.contains(inAppPurchaseLocalization.id) ? inAppPurchaseLocalization : nil
              })
        else {
            return []
        }
        return inAppPurchaseLocalizations
    }

    public func getPricePoints(for inAppPurchaseV2: InAppPurchaseV2) -> [InAppPurchasePricePoint] {
        guard let pricePointIds = inAppPurchaseV2.relationships?.pricePoints?.data?.map(\.id),
              let pricePoints = included?.compactMap({ relationship -> InAppPurchasePricePoint? in
                  guard case let .inAppPurchasePricePoint(pricePoint) = relationship else { return nil }
                  return pricePointIds.contains(pricePoint.id) ? pricePoint : nil
              })
        else {
            return []
        }
        return pricePoints
    }

    public func getPromotedPurchase(for inAppPurchaseV2: InAppPurchaseV2) -> PromotedPurchase? {
        included?.compactMap { relationship -> PromotedPurchase? in
            guard case let .promotedPurchase(promotedPurchase) = relationship else { return nil }
            return promotedPurchase
        }.first { $0.id == inAppPurchaseV2.relationships?.promotedPurchase?.data?.id }
    }

    public enum Included: Codable {
        case inAppPurchaseAppStoreReviewScreenshot(InAppPurchaseAppStoreReviewScreenshot)
        case inAppPurchaseAvailability(InAppPurchaseAvailability)
        case inAppPurchaseContent(InAppPurchaseContent)
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

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
