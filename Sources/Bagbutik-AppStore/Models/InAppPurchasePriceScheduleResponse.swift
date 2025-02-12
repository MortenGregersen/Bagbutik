import Bagbutik_Core
import Bagbutik_Models
import Foundation

public struct InAppPurchasePriceScheduleResponse: Codable, Sendable {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(InAppPurchasePriceSchedule.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
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

    public enum Included: Codable, Sendable {
        case inAppPurchasePrice(InAppPurchasePrice)
        case territory(Territory)

        public init(from decoder: Decoder) throws {
            if let inAppPurchasePrice = try? InAppPurchasePrice(from: decoder) {
                self = .inAppPurchasePrice(inAppPurchasePrice)
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
            case let .territory(value):
                try value.encode(to: encoder)
            }
        }
    }
}
