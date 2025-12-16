import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # InAppPurchaseOfferCodesResponse
 A response that contains a list of in-app purchase offer code resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchaseoffercodesresponse>
 */
public struct InAppPurchaseOfferCodesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = InAppPurchaseOfferCode

    public let data: [InAppPurchaseOfferCode]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [InAppPurchaseOfferCode],
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
        data = try container.decode([InAppPurchaseOfferCode].self, forKey: "data")
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

    public func getCustomCodes(for inAppPurchaseOfferCode: InAppPurchaseOfferCode) -> [InAppPurchaseOfferCodeCustomCode] {
        guard let customCodeIds = inAppPurchaseOfferCode.relationships?.customCodes?.data?.map(\.id),
              let customCodes = included?.compactMap({ relationship -> InAppPurchaseOfferCodeCustomCode? in
                  guard case let .inAppPurchaseOfferCodeCustomCode(customCode) = relationship else { return nil }
                  return customCodeIds.contains(customCode.id) ? customCode : nil
              })
        else {
            return []
        }
        return customCodes
    }

    public func getOneTimeUseCodes(for inAppPurchaseOfferCode: InAppPurchaseOfferCode) -> [InAppPurchaseOfferCodeOneTimeUseCode] {
        guard let oneTimeUseCodeIds = inAppPurchaseOfferCode.relationships?.oneTimeUseCodes?.data?.map(\.id),
              let oneTimeUseCodes = included?.compactMap({ relationship -> InAppPurchaseOfferCodeOneTimeUseCode? in
                  guard case let .inAppPurchaseOfferCodeOneTimeUseCode(oneTimeUseCode) = relationship else { return nil }
                  return oneTimeUseCodeIds.contains(oneTimeUseCode.id) ? oneTimeUseCode : nil
              })
        else {
            return []
        }
        return oneTimeUseCodes
    }

    public func getPrices(for inAppPurchaseOfferCode: InAppPurchaseOfferCode) -> [InAppPurchaseOfferPrice] {
        guard let priceIds = inAppPurchaseOfferCode.relationships?.prices?.data?.map(\.id),
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
            if let inAppPurchaseOfferCodeCustomCode = try? InAppPurchaseOfferCodeCustomCode(from: decoder) {
                self = .inAppPurchaseOfferCodeCustomCode(inAppPurchaseOfferCodeCustomCode)
            } else if let inAppPurchaseOfferCodeOneTimeUseCode = try? InAppPurchaseOfferCodeOneTimeUseCode(from: decoder) {
                self = .inAppPurchaseOfferCodeOneTimeUseCode(inAppPurchaseOfferCodeOneTimeUseCode)
            } else if let inAppPurchaseOfferPrice = try? InAppPurchaseOfferPrice(from: decoder) {
                self = .inAppPurchaseOfferPrice(inAppPurchaseOfferPrice)
            } else {
                throw DecodingError.typeMismatch(
                    Included.self,
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown Included"))
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
