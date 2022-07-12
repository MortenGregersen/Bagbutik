import Foundation

public struct CustomerReviewsResponse: Codable, PagedResponse {
    public typealias Data = CustomerReview
    public let data: [CustomerReview]
    public var included: [CustomerReviewResponseV1]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [CustomerReview], included: [CustomerReviewResponseV1]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
