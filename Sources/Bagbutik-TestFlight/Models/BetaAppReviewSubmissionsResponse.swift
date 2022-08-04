import Foundation
import Bagbutik_Core

/**
 # BetaAppReviewSubmissionsResponse
 A response that contains a list of Beta App Review Submission resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappreviewsubmissionsresponse>
 */
public struct BetaAppReviewSubmissionsResponse: Codable, PagedResponse {
    public typealias Data = BetaAppReviewSubmission

    /// The resource data.
    public let data: [BetaAppReviewSubmission]
    public var included: [Build]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [BetaAppReviewSubmission],
                included: [Build]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
