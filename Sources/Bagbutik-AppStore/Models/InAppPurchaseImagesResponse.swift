import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # InAppPurchaseImagesResponse
 A response that contains a list of in-app purchase image resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchaseimagesresponse>
 */
public struct InAppPurchaseImagesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = InAppPurchaseImage

    public let data: [InAppPurchaseImage]
    public var included: [InAppPurchaseV2]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [InAppPurchaseImage],
                included: [InAppPurchaseV2]? = nil,
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
        data = try container.decode([InAppPurchaseImage].self, forKey: "data")
        included = try container.decodeIfPresent([InAppPurchaseV2].self, forKey: "included")
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
