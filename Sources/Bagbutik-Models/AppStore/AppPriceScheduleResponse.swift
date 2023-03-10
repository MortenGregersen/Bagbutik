import Bagbutik_Core
import Foundation

public struct AppPriceScheduleResponse: Codable {
    public let data: AppPriceSchedule
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: AppPriceSchedule,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public func getApp() -> App? {
        included?.compactMap { relationship -> App? in
            guard case let .app(app) = relationship else { return nil }
            return app
        }.first { $0.id == data.relationships?.app?.data?.id }
    }

    public func getAutomaticPrices() -> [AppPriceV2] {
        guard let automaticPriceIds = data.relationships?.automaticPrices?.data?.map(\.id),
              let automaticPrices = included?.compactMap({ relationship -> AppPriceV2? in
                  guard case let .appPriceV2(automaticPrice) = relationship else { return nil }
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

    public func getManualPrices() -> [AppPriceV2] {
        guard let manualPriceIds = data.relationships?.manualPrices?.data?.map(\.id),
              let manualPrices = included?.compactMap({ relationship -> AppPriceV2? in
                  guard case let .appPriceV2(manualPrice) = relationship else { return nil }
                  return manualPriceIds.contains(manualPrice.id) ? manualPrice : nil
              })
        else {
            return []
        }
        return manualPrices
    }

    public enum Included: Codable {
        case app(App)
        case appPriceV2(AppPriceV2)
        case territory(Territory)

        public init(from decoder: Decoder) throws {
            if let app = try? App(from: decoder) {
                self = .app(app)
            } else if let appPriceV2 = try? AppPriceV2(from: decoder) {
                self = .appPriceV2(appPriceV2)
            } else if let territory = try? Territory(from: decoder) {
                self = .territory(territory)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .app(value):
                try value.encode(to: encoder)
            case let .appPriceV2(value):
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
