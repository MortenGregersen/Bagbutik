import Foundation

/// A response that contains a list of Beta App Review Detail resources.
public struct BetaAppReviewDetailsResponse: Codable {
    /// The resource data.
    public let data: [BetaAppReviewDetail]
    public let included: [App]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [BetaAppReviewDetail], included: [App]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
