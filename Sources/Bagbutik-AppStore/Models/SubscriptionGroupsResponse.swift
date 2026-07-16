import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # SubscriptionGroupsResponse
 The response body for endpoints that list subscription groups for an app.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptiongroupsresponse>
 */
public struct SubscriptionGroupsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = SubscriptionGroup

    public let data: [SubscriptionGroup]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [SubscriptionGroup],
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
        data = try container.decode([SubscriptionGroup].self, forKey: "data")
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

    public func getSubscriptionGroupLocalizations(for subscriptionGroup: SubscriptionGroup) -> [SubscriptionGroupLocalization] {
        guard let subscriptionGroupLocalizationIds = subscriptionGroup.relationships?.subscriptionGroupLocalizations?.data?.map(\.id),
              let subscriptionGroupLocalizations = included?.compactMap({ relationship -> SubscriptionGroupLocalization? in
                  guard case let .subscriptionGroupLocalization(subscriptionGroupLocalization) = relationship else { return nil }
                  return subscriptionGroupLocalizationIds.contains(subscriptionGroupLocalization.id) ? subscriptionGroupLocalization : nil
              })
        else {
            return []
        }
        return subscriptionGroupLocalizations
    }

    public func getSubscriptions(for subscriptionGroup: SubscriptionGroup) -> [Subscription] {
        guard let subscriptionIds = subscriptionGroup.relationships?.subscriptions?.data?.map(\.id),
              let subscriptions = included?.compactMap({ relationship -> Subscription? in
                  guard case let .subscription(subscription) = relationship else { return nil }
                  return subscriptionIds.contains(subscription.id) ? subscription : nil
              })
        else {
            return []
        }
        return subscriptions
    }

    public func getVersions(for subscriptionGroup: SubscriptionGroup) -> [SubscriptionGroupVersion] {
        guard let versionIds = subscriptionGroup.relationships?.versions?.data?.map(\.id),
              let versions = included?.compactMap({ relationship -> SubscriptionGroupVersion? in
                  guard case let .subscriptionGroupVersion(version) = relationship else { return nil }
                  return versionIds.contains(version.id) ? version : nil
              })
        else {
            return []
        }
        return versions
    }

    public enum Included: Codable, Sendable {
        case subscription(Subscription)
        case subscriptionGroupLocalization(SubscriptionGroupLocalization)
        case subscriptionGroupVersion(SubscriptionGroupVersion)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "subscriptions":
                self = .subscription(try Subscription(from: decoder))
            case "subscriptionGroupLocalizations":
                self = .subscriptionGroupLocalization(try SubscriptionGroupLocalization(from: decoder))
            case "subscriptionGroupVersions":
                self = .subscriptionGroupVersion(try SubscriptionGroupVersion(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .subscription(value):
                try value.encode(to: encoder)
            case let .subscriptionGroupLocalization(value):
                try value.encode(to: encoder)
            case let .subscriptionGroupVersion(value):
                try value.encode(to: encoder)
            }
        }
    }
}
