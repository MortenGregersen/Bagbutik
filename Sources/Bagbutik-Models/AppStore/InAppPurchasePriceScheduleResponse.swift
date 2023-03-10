import Bagbutik_Core
import Foundation

public struct InAppPurchasePriceScheduleResponse: Codable {
    public let data: InAppPurchasePriceSchedule
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: InAppPurchasePriceSchedule,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public func getAutomaticPrices() -> [InAppPurchasePrice] {
        guard let automaticPriceIds = data.relationships?.automaticPrices?.data?.map(\.id),
              let automaticPrices = included?.compactMap({ relationship -> InAppPurchasePrice? in
                  guard case let .inAppPurchasePrice(automaticPrice) = relationship else { return nil }
                  return automaticPriceIds.contains(automaticPrice.id) ? automaticPrice : nil
              })
        else {
            return []
        }
        return automaticPrices
    }

    public func getBaseTerritory() -> Territory? {
        included?.compactMap { relationship -> Territory? in
            guard case let .territory(baseTerritory) = relationship else { return nil }
            return baseTerritory
        }.first { $0.id == data.relationships?.baseTerritory?.data?.id }
    }

    public func getInAppPurchase() -> InAppPurchaseV2? {
        included?.compactMap { relationship -> InAppPurchaseV2? in
            guard case let .inAppPurchaseV2(inAppPurchase) = relationship else { return nil }
            return inAppPurchase
        }.first { $0.id == data.relationships?.inAppPurchase?.data?.id }
    }

    public func getManualPrices() -> [InAppPurchasePrice] {
        guard let manualPriceIds = data.relationships?.manualPrices?.data?.map(\.id),
              let manualPrices = included?.compactMap({ relationship -> InAppPurchasePrice? in
                  guard case let .inAppPurchasePrice(manualPrice) = relationship else { return nil }
                  return manualPriceIds.contains(manualPrice.id) ? manualPrice : nil
              })
        else {
            return []
        }
        return manualPrices
    }

    public enum Included: Codable {
        case inAppPurchasePrice(InAppPurchasePrice)
        case inAppPurchaseV2(InAppPurchaseV2)
        case territory(Territory)

        public init(from decoder: Decoder) throws {
            if let inAppPurchasePrice = try? InAppPurchasePrice(from: decoder) {
                self = .inAppPurchasePrice(inAppPurchasePrice)
            } else if let inAppPurchaseV2 = try? InAppPurchaseV2(from: decoder) {
                self = .inAppPurchaseV2(inAppPurchaseV2)
            } else if let territory = try? Territory(from: decoder) {
                self = .territory(territory)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .inAppPurchasePrice(value):
                try value.encode(to: encoder)
            case let .inAppPurchaseV2(value):
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
