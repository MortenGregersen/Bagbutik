import Foundation

public struct BetaAppReviewDetailsResponse: Codable {
    public let data: [BetaAppReviewDetail]
    public let included: [App]?
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [BetaAppReviewDetail], included: [App]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
