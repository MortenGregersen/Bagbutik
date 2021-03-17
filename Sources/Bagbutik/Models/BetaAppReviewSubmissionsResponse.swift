import Foundation

/**
 A response that contains a list of Beta App Review Submission resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappreviewsubmissionsresponse>
 */
public struct BetaAppReviewSubmissionsResponse: Codable {
    /// The resource data.
    public let data: [BetaAppReviewSubmission]
    public let included: [Build]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public let meta: PagingInformation?

    public init(data: [BetaAppReviewSubmission], included: [Build]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
