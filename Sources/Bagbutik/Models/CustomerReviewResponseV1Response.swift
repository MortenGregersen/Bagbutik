import Foundation

/**
 A response that contains a single Customer Review Responses resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/customerreviewresponsev1response>
 */
public struct CustomerReviewResponseV1Response: Codable {
    /// The data structure that represents a `CustomerReviewResponses` resource.
    public let data: CustomerReviewResponseV1
    /// The requested relationship data.
    public var included: [CustomerReview]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: CustomerReviewResponseV1, included: [CustomerReview]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
