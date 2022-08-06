import Bagbutik_Core
import Foundation

public struct SubscriptionGroupResponse: Codable {
    public let data: SubscriptionGroup
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: SubscriptionGroup,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public func getSubscriptionGroupLocalizations() -> [SubscriptionGroupLocalization] {
        guard let subscriptionGroupLocalizationIds = data.relationships?.subscriptionGroupLocalizations?.data?.map(\.id),
              let subscriptionGroupLocalizations = included?.compactMap({ relationship -> SubscriptionGroupLocalization? in
                  guard case let .subscriptionGroupLocalization(subscriptionGroupLocalization) = relationship else { return nil }
                  return subscriptionGroupLocalizationIds.contains(subscriptionGroupLocalization.id) ? subscriptionGroupLocalization : nil
              })
        else {
            return []
        }
        return subscriptionGroupLocalizations
    }

    public func getSubscriptions() -> [Subscription] {
        guard let subscriptionIds = data.relationships?.subscriptions?.data?.map(\.id),
              let subscriptions = included?.compactMap({ relationship -> Subscription? in
                  guard case let .subscription(subscription) = relationship else { return nil }
                  return subscriptionIds.contains(subscription.id) ? subscription : nil
              })
        else {
            return []
        }
        return subscriptions
    }

    public enum Included: Codable {
        case subscription(Subscription)
        case subscriptionGroupLocalization(SubscriptionGroupLocalization)

        public init(from decoder: Decoder) throws {
            if let subscription = try? Subscription(from: decoder) {
                self = .subscription(subscription)
            } else if let subscriptionGroupLocalization = try? SubscriptionGroupLocalization(from: decoder) {
                self = .subscriptionGroupLocalization(subscriptionGroupLocalization)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .subscription(value):
                try value.encode(to: encoder)
            case let .subscriptionGroupLocalization(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
