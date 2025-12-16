import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # InAppPurchaseOfferCodeOneTimeUseCodesResponse
 A response that contains a list of in-app purchase offer code one-time use code resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchaseoffercodeonetimeusecodesresponse>
 */
public struct InAppPurchaseOfferCodeOneTimeUseCodesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = InAppPurchaseOfferCodeOneTimeUseCode

    public let data: [InAppPurchaseOfferCodeOneTimeUseCode]
    public var included: [Actor]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [InAppPurchaseOfferCodeOneTimeUseCode],
                included: [Actor]? = nil,
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
        data = try container.decode([InAppPurchaseOfferCodeOneTimeUseCode].self, forKey: "data")
        included = try container.decodeIfPresent([Actor].self, forKey: "included")
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

    public func getCreatedByActor(for inAppPurchaseOfferCodeOneTimeUseCode: InAppPurchaseOfferCodeOneTimeUseCode) -> Actor? {
        included?.first { $0.id == inAppPurchaseOfferCodeOneTimeUseCode.relationships?.createdByActor?.data?.id }
    }

    public func getDeactivatedByActor(for inAppPurchaseOfferCodeOneTimeUseCode: InAppPurchaseOfferCodeOneTimeUseCode) -> Actor? {
        included?.first { $0.id == inAppPurchaseOfferCodeOneTimeUseCode.relationships?.deactivatedByActor?.data?.id }
    }
}
