import Foundation
import Bagbutik_Core

/**
 # BetaAppReviewDetailsResponse
 A response that contains a list of Beta App Review Detail resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappreviewdetailsresponse>
 */
public struct BetaAppReviewDetailsResponse: Codable, PagedResponse {
    public typealias Data = BetaAppReviewDetail

    /// The resource data.
    public let data: [BetaAppReviewDetail]
    public var included: [App]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [BetaAppReviewDetail],
                included: [App]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
