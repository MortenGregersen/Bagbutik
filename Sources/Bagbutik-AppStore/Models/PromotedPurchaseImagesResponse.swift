import Bagbutik_Core
import Bagbutik_Models
import Foundation

public struct PromotedPurchaseImagesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = PromotedPurchaseImage

    public let data: [PromotedPurchaseImage]
    public var included: [PromotedPurchase]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [PromotedPurchaseImage],
                included: [PromotedPurchase]? = nil,
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
        data = try container.decode([PromotedPurchaseImage].self, forKey: "data")
        included = try container.decodeIfPresent([PromotedPurchase].self, forKey: "included")
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
}
