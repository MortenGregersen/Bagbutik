import Bagbutik_Core
import Foundation

public struct SubscriptionAvailabilityResponse: Codable, Sendable {
    public let data: SubscriptionAvailability
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: SubscriptionAvailability,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(SubscriptionAvailability.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
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

    public func getSubscription() -> Subscription? {
        included?.compactMap { relationship -> Subscription? in
            guard case let .subscription(subscription) = relationship else { return nil }
            return subscription
        }.first { $0.id == data.relationships?.subscription?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case subscription(Subscription)
        case territory(Territory)

        public init(from decoder: Decoder) throws {
            if let subscription = try? Subscription(from: decoder) {
                self = .subscription(subscription)
            } else if let territory = try? Territory(from: decoder) {
                self = .territory(territory)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .subscription(value):
                try value.encode(to: encoder)
            case let .territory(value):
                try value.encode(to: encoder)
            }
        }
    }
}
