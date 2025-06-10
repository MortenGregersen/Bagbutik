import Bagbutik_Core
import Bagbutik_Models
import Foundation

public struct PromotedPurchasesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = PromotedPurchase

    public let data: [PromotedPurchase]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [PromotedPurchase],
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
        data = try container.decode([PromotedPurchase].self, forKey: "data")
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

    public func getInAppPurchaseV2(for promotedPurchase: PromotedPurchase) -> InAppPurchaseV2? {
        included?.compactMap { relationship -> InAppPurchaseV2? in
            guard case let .inAppPurchaseV2(inAppPurchaseV2) = relationship else { return nil }
            return inAppPurchaseV2
        }.first { $0.id == promotedPurchase.relationships?.inAppPurchaseV2?.data?.id }
    }

    public func getSubscription(for promotedPurchase: PromotedPurchase) -> Subscription? {
        included?.compactMap { relationship -> Subscription? in
            guard case let .subscription(subscription) = relationship else { return nil }
            return subscription
        }.first { $0.id == promotedPurchase.relationships?.subscription?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case inAppPurchaseV2(InAppPurchaseV2)
        case subscription(Subscription)

        public init(from decoder: Decoder) throws {
            if let inAppPurchaseV2 = try? InAppPurchaseV2(from: decoder) {
                self = .inAppPurchaseV2(inAppPurchaseV2)
            } else if let subscription = try? Subscription(from: decoder) {
                self = .subscription(subscription)
            } else {
                throw DecodingError.typeMismatch(
                    Included.self,
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .inAppPurchaseV2(value):
                try value.encode(to: encoder)
            case let .subscription(value):
                try value.encode(to: encoder)
            }
        }
    }
}
