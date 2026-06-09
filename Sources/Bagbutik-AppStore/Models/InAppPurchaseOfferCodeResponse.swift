import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # InAppPurchaseOfferCodeResponse
 A response that contains a single in-app purchase offer code resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchaseoffercoderesponse>
 */
public struct InAppPurchaseOfferCodeResponse: Codable, Sendable {
    public let data: InAppPurchaseOfferCode
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: InAppPurchaseOfferCode,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(InAppPurchaseOfferCode.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getCustomCodes() -> [InAppPurchaseOfferCodeCustomCode] {
        guard let customCodeIds = data.relationships?.customCodes?.data?.map(\.id),
              let customCodes = included?.compactMap({ relationship -> InAppPurchaseOfferCodeCustomCode? in
                  guard case let .inAppPurchaseOfferCodeCustomCode(customCode) = relationship else { return nil }
                  return customCodeIds.contains(customCode.id) ? customCode : nil
              })
        else {
            return []
        }
        return customCodes
    }

    public func getOneTimeUseCodes() -> [InAppPurchaseOfferCodeOneTimeUseCode] {
        guard let oneTimeUseCodeIds = data.relationships?.oneTimeUseCodes?.data?.map(\.id),
              let oneTimeUseCodes = included?.compactMap({ relationship -> InAppPurchaseOfferCodeOneTimeUseCode? in
                  guard case let .inAppPurchaseOfferCodeOneTimeUseCode(oneTimeUseCode) = relationship else { return nil }
                  return oneTimeUseCodeIds.contains(oneTimeUseCode.id) ? oneTimeUseCode : nil
              })
        else {
            return []
        }
        return oneTimeUseCodes
    }

    public func getPrices() -> [InAppPurchaseOfferPrice] {
        guard let priceIds = data.relationships?.prices?.data?.map(\.id),
              let prices = included?.compactMap({ relationship -> InAppPurchaseOfferPrice? in
                  guard case let .inAppPurchaseOfferPrice(price) = relationship else { return nil }
                  return priceIds.contains(price.id) ? price : nil
              })
        else {
            return []
        }
        return prices
    }

    public enum Included: Codable, Sendable {
        case inAppPurchaseOfferCodeCustomCode(InAppPurchaseOfferCodeCustomCode)
        case inAppPurchaseOfferCodeOneTimeUseCode(InAppPurchaseOfferCodeOneTimeUseCode)
        case inAppPurchaseOfferPrice(InAppPurchaseOfferPrice)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "inAppPurchaseOfferCodeCustomCodes":
                self = .inAppPurchaseOfferCodeCustomCode(try InAppPurchaseOfferCodeCustomCode(from: decoder))
            case "inAppPurchaseOfferCodeOneTimeUseCodes":
                self = .inAppPurchaseOfferCodeOneTimeUseCode(try InAppPurchaseOfferCodeOneTimeUseCode(from: decoder))
            case "inAppPurchaseOfferPrices":
                self = .inAppPurchaseOfferPrice(try InAppPurchaseOfferPrice(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .inAppPurchaseOfferCodeCustomCode(value):
                try value.encode(to: encoder)
            case let .inAppPurchaseOfferCodeOneTimeUseCode(value):
                try value.encode(to: encoder)
            case let .inAppPurchaseOfferPrice(value):
                try value.encode(to: encoder)
            }
        }
    }
}
