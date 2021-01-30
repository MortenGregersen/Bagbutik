import Foundation

public struct BetaAppReviewSubmissionsResponse: Codable {
    public let data: [BetaAppReviewSubmission]
    public let included: [Build]?
    public let links: PagedDocumentLinks
    public let meta: PagingInformation?

    public init(data: [BetaAppReviewSubmission], included: [Build]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
