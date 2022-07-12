import Foundation

public struct InAppPurchasePricesResponse: Codable, PagedResponse {
    public typealias Data = InAppPurchasePrice
    public let data: [InAppPurchasePrice]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [InAppPurchasePrice], included: [Included]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public func getInAppPurchasePricePoint(for inAppPurchasePrice: InAppPurchasePrice) -> InAppPurchasePricePoint? {
        included?.compactMap { relationship -> InAppPurchasePricePoint? in
            guard case let .inAppPurchasePricePoint(inAppPurchasePricePoint) = relationship else { return nil }
            return inAppPurchasePricePoint
        }.first { $0.id == inAppPurchasePrice.relationships?.inAppPurchasePricePoint?.data?.id }
    }

    public func getTerritory(for inAppPurchasePrice: InAppPurchasePrice) -> Territory? {
        included?.compactMap { relationship -> Territory? in
            guard case let .territory(territory) = relationship else { return nil }
            return territory
        }.first { $0.id == inAppPurchasePrice.relationships?.territory?.data?.id }
    }

    public enum Included: Codable {
        case inAppPurchasePricePoint(InAppPurchasePricePoint)
        case territory(Territory)

        public init(from decoder: Decoder) throws {
            if let inAppPurchasePricePoint = try? InAppPurchasePricePoint(from: decoder) {
                self = .inAppPurchasePricePoint(inAppPurchasePricePoint)
            } else if let territory = try? Territory(from: decoder) {
                self = .territory(territory)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .inAppPurchasePricePoint(value):
                try value.encode(to: encoder)
            case let .territory(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
