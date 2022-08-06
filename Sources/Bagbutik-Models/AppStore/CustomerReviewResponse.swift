import Bagbutik_Core
import Foundation

/**
 # CustomerReviewResponse
 A response that contains a single Customer Review resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/customerreviewresponse>
 */
public struct CustomerReviewResponse: Codable {
    /// The data structure that represents a `CustomerReviews` resource.
    public let data: CustomerReview
    /// The requested relationship data.
    public var included: [CustomerReviewResponseV1]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: CustomerReview,
                included: [CustomerReviewResponseV1]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
