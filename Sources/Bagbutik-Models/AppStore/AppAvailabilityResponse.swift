import Bagbutik_Core
import Foundation

public struct AppAvailabilityResponse: Codable {
    public let data: AppAvailability
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: AppAvailability,
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

    public func getAvailableTerritories() -> [Territory] {
        guard let availableTerritoryIds = data.relationships?.availableTerritories?.data?.map(\.id),
              let availableTerritories = included?.compactMap({ relationship -> Territory? in
                  guard case let .territory(availableTerritory) = relationship else { return nil }
                  return availableTerritoryIds.contains(availableTerritory.id) ? availableTerritory : nil
              })
        else {
            return []
        }
        return availableTerritories
    }

    public enum Included: Codable {
        case app(App)
        case territory(Territory)

        public init(from decoder: Decoder) throws {
            if let app = try? App(from: decoder) {
                self = .app(app)
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
            case let .territory(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
