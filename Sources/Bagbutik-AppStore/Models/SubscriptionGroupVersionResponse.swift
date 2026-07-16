import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # SubscriptionGroupVersionResponse
 The response body for endpoints that create or read a subscription group version.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptiongroupversionresponse>
 */
public struct SubscriptionGroupVersionResponse: Codable, Sendable {
    public let data: SubscriptionGroupVersion
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: SubscriptionGroupVersion,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(SubscriptionGroupVersion.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getLocalizations() -> [SubscriptionGroupLocalizationV2] {
        guard let localizationIds = data.relationships?.localizations?.data?.map(\.id),
              let localizations = included?.compactMap({ relationship -> SubscriptionGroupLocalizationV2? in
                  guard case let .subscriptionGroupLocalizationV2(localization) = relationship else { return nil }
                  return localizationIds.contains(localization.id) ? localization : nil
              })
        else {
            return []
        }
        return localizations
    }

    public func getSubscriptionGroup() -> SubscriptionGroup? {
        included?.compactMap { relationship -> SubscriptionGroup? in
            guard case let .subscriptionGroup(subscriptionGroup) = relationship else { return nil }
            return subscriptionGroup
        }.first { $0.id == data.relationships?.subscriptionGroup?.data?.id }
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
