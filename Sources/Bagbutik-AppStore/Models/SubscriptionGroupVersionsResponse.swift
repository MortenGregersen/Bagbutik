import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # SubscriptionGroupVersionsResponse
 The response body for endpoints that list subscription group versions.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptiongroupversionsresponse>
 */
public struct SubscriptionGroupVersionsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = SubscriptionGroupVersion

    public let data: [SubscriptionGroupVersion]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [SubscriptionGroupVersion],
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
        data = try container.decode([SubscriptionGroupVersion].self, forKey: "data")
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

    public func getLocalizations(for subscriptionGroupVersion: SubscriptionGroupVersion) -> [SubscriptionGroupLocalizationV2] {
        guard let localizationIds = subscriptionGroupVersion.relationships?.localizations?.data?.map(\.id),
              let localizations = included?.compactMap({ relationship -> SubscriptionGroupLocalizationV2? in
                  guard case let .subscriptionGroupLocalizationV2(localization) = relationship else { return nil }
                  return localizationIds.contains(localization.id) ? localization : nil
              })
        else {
            return []
        }
        return localizations
    }

    public func getSubscriptionGroup(for subscriptionGroupVersion: SubscriptionGroupVersion) -> SubscriptionGroup? {
        included?.compactMap { relationship -> SubscriptionGroup? in
            guard case let .subscriptionGroup(subscriptionGroup) = relationship else { return nil }
            return subscriptionGroup
        }.first { $0.id == subscriptionGroupVersion.relationships?.subscriptionGroup?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case subscriptionGroup(SubscriptionGroup)
        case subscriptionGroupLocalizationV2(SubscriptionGroupLocalizationV2)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "subscriptionGroups":
                self = .subscriptionGroup(try SubscriptionGroup(from: decoder))
            case "subscriptionGroupLocalizations":
                self = .subscriptionGroupLocalizationV2(try SubscriptionGroupLocalizationV2(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .subscriptionGroup(value):
                try value.encode(to: encoder)
            case let .subscriptionGroupLocalizationV2(value):
                try value.encode(to: encoder)
            }
        }
    }
}
