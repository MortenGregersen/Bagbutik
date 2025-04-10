import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # WinBackOffersResponse
 A response that contains a list of win-back offer resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/winbackoffersresponse>
 */
public struct WinBackOffersResponse: Codable, Sendable, PagedResponse {
    public typealias Data = WinBackOffer

    public let data: [WinBackOffer]
    public var included: [WinBackOfferPrice]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [WinBackOffer],
                included: [WinBackOfferPrice]? = nil,
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
        data = try container.decode([WinBackOffer].self, forKey: "data")
        included = try container.decodeIfPresent([WinBackOfferPrice].self, forKey: "included")
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

    public func getPrices(for winBackOffer: WinBackOffer) -> [WinBackOfferPrice] {
        guard let priceIds = winBackOffer.relationships?.prices?.data?.map(\.id) else { return [] }
        return included?.filter { priceIds.contains($0.id) } ?? []
    }
}
