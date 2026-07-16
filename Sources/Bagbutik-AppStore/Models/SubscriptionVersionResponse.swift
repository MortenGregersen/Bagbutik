import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # SubscriptionVersionResponse
 The response body for endpoints that create or read a subscription version.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionversionresponse>
 */
public struct SubscriptionVersionResponse: Codable, Sendable {
    public let data: SubscriptionVersion
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: SubscriptionVersion,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(SubscriptionVersion.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getImage() -> SubscriptionImageV2? {
        included?.compactMap { relationship -> SubscriptionImageV2? in
            guard case let .subscriptionImageV2(image) = relationship else { return nil }
            return image
        }.first { $0.id == data.relationships?.image?.data?.id }
    }

    public func getImages() -> [SubscriptionImageV2] {
        guard let imageIds = data.relationships?.images?.data?.map(\.id),
              let images = included?.compactMap({ relationship -> SubscriptionImageV2? in
                  guard case let .subscriptionImageV2(image) = relationship else { return nil }
                  return imageIds.contains(image.id) ? image : nil
              })
        else {
            return []
        }
        return images
    }

    public func getLocalizations() -> [SubscriptionLocalizationV2] {
        guard let localizationIds = data.relationships?.localizations?.data?.map(\.id),
              let localizations = included?.compactMap({ relationship -> SubscriptionLocalizationV2? in
                  guard case let .subscriptionLocalizationV2(localization) = relationship else { return nil }
                  return localizationIds.contains(localization.id) ? localization : nil
              })
        else {
            return []
        }
        return localizations
    }

    public func getSubscription() -> Subscription? {
        included?.compactMap { relationship -> Subscription? in
            guard case let .subscription(subscription) = relationship else { return nil }
            return subscription
        }.first { $0.id == data.relationships?.subscription?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case subscription(Subscription)
        case subscriptionImageV2(SubscriptionImageV2)
        case subscriptionLocalizationV2(SubscriptionLocalizationV2)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "subscriptions":
                self = .subscription(try Subscription(from: decoder))
            case "subscriptionImages":
                self = .subscriptionImageV2(try SubscriptionImageV2(from: decoder))
            case "subscriptionLocalizations":
                self = .subscriptionLocalizationV2(try SubscriptionLocalizationV2(from: decoder))
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
            case let .subscriptionImageV2(value):
                try value.encode(to: encoder)
            case let .subscriptionLocalizationV2(value):
                try value.encode(to: encoder)
            }
        }
    }
}
