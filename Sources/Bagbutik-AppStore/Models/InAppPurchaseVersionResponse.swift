import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # InAppPurchaseVersionResponse
 The response body for endpoints that create or read an in-app purchase version.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchaseversionresponse>
 */
public struct InAppPurchaseVersionResponse: Codable, Sendable {
    public let data: InAppPurchaseVersion
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: InAppPurchaseVersion,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(InAppPurchaseVersion.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getImage() -> InAppPurchaseImageV2? {
        included?.compactMap { relationship -> InAppPurchaseImageV2? in
            guard case let .inAppPurchaseImageV2(image) = relationship else { return nil }
            return image
        }.first { $0.id == data.relationships?.image?.data?.id }
    }

    public func getImages() -> [InAppPurchaseImageV2] {
        guard let imageIds = data.relationships?.images?.data?.map(\.id),
              let images = included?.compactMap({ relationship -> InAppPurchaseImageV2? in
                  guard case let .inAppPurchaseImageV2(image) = relationship else { return nil }
                  return imageIds.contains(image.id) ? image : nil
              })
        else {
            return []
        }
        return images
    }

    public func getInAppPurchase() -> InAppPurchaseV2? {
        included?.compactMap { relationship -> InAppPurchaseV2? in
            guard case let .inAppPurchaseV2(inAppPurchase) = relationship else { return nil }
            return inAppPurchase
        }.first { $0.id == data.relationships?.inAppPurchase?.data?.id }
    }

    public func getLocalizations() -> [InAppPurchaseLocalizationV2] {
        guard let localizationIds = data.relationships?.localizations?.data?.map(\.id),
              let localizations = included?.compactMap({ relationship -> InAppPurchaseLocalizationV2? in
                  guard case let .inAppPurchaseLocalizationV2(localization) = relationship else { return nil }
                  return localizationIds.contains(localization.id) ? localization : nil
              })
        else {
            return []
        }
        return localizations
    }

    public enum Included: Codable, Sendable {
        case inAppPurchaseImageV2(InAppPurchaseImageV2)
        case inAppPurchaseLocalizationV2(InAppPurchaseLocalizationV2)
        case inAppPurchaseV2(InAppPurchaseV2)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "inAppPurchaseImages":
                self = .inAppPurchaseImageV2(try InAppPurchaseImageV2(from: decoder))
            case "inAppPurchaseLocalizations":
                self = .inAppPurchaseLocalizationV2(try InAppPurchaseLocalizationV2(from: decoder))
            case "inAppPurchases":
                self = .inAppPurchaseV2(try InAppPurchaseV2(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .inAppPurchaseImageV2(value):
                try value.encode(to: encoder)
            case let .inAppPurchaseLocalizationV2(value):
                try value.encode(to: encoder)
            case let .inAppPurchaseV2(value):
                try value.encode(to: encoder)
            }
        }
    }
}
