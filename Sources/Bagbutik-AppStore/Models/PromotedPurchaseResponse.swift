import Foundation
import Bagbutik_Core

public struct PromotedPurchaseResponse: Codable {
    public let data: PromotedPurchase
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: PromotedPurchase,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public func getInAppPurchaseV2() -> InAppPurchaseV2? {
        included?.compactMap { relationship -> InAppPurchaseV2? in
            guard case let .inAppPurchaseV2(inAppPurchaseV2) = relationship else { return nil }
            return inAppPurchaseV2
        }.first { $0.id == data.relationships?.inAppPurchaseV2?.data?.id }
    }

    public func getPromotionImages() -> [PromotedPurchaseImage] {
        guard let promotionImageIds = data.relationships?.promotionImages?.data?.map(\.id),
              let promotionImages = included?.compactMap({ relationship -> PromotedPurchaseImage? in
                  guard case let .promotedPurchaseImage(promotionImage) = relationship else { return nil }
                  return promotionImageIds.contains(promotionImage.id) ? promotionImage : nil
              })
        else {
            return []
        }
        return promotionImages
    }

    public func getSubscription() -> Subscription? {
        included?.compactMap { relationship -> Subscription? in
            guard case let .subscription(subscription) = relationship else { return nil }
            return subscription
        }.first { $0.id == data.relationships?.subscription?.data?.id }
    }

    public enum Included: Codable {
        case inAppPurchaseV2(InAppPurchaseV2)
        case promotedPurchaseImage(PromotedPurchaseImage)
        case subscription(Subscription)

        public init(from decoder: Decoder) throws {
            if let inAppPurchaseV2 = try? InAppPurchaseV2(from: decoder) {
                self = .inAppPurchaseV2(inAppPurchaseV2)
            } else if let promotedPurchaseImage = try? PromotedPurchaseImage(from: decoder) {
                self = .promotedPurchaseImage(promotedPurchaseImage)
            } else if let subscription = try? Subscription(from: decoder) {
                self = .subscription(subscription)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .inAppPurchaseV2(value):
                try value.encode(to: encoder)
            case let .promotedPurchaseImage(value):
                try value.encode(to: encoder)
            case let .subscription(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
