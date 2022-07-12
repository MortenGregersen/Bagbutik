import Foundation

public struct PromotedPurchaseImagesResponse: Codable, PagedResponse {
    public typealias Data = PromotedPurchaseImage
    public let data: [PromotedPurchaseImage]
    public var included: [PromotedPurchase]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [PromotedPurchaseImage], included: [PromotedPurchase]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
