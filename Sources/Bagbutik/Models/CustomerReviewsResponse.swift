import Foundation

/**
 A response that contains a list of Customer Reviews resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/customerreviewsresponse>
 */
public struct CustomerReviewsResponse: Codable, PagedResponse {
    public typealias Data = CustomerReview
    /// A list of customer review resource data.
    public let data: [CustomerReview]
    /// The requested relationship data.
    public var included: [CustomerReviewResponseV1]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [CustomerReview], included: [CustomerReviewResponseV1]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
