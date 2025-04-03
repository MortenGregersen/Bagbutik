import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # CustomerReviewsResponse
 A response that contains a list of Customer Reviews resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/customerreviewsresponse>
 */
public struct CustomerReviewsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = CustomerReview

    /// A list of customer review resource data.
    public let data: [CustomerReview]
    /// The requested relationship data.
    public var included: [CustomerReviewResponseV1]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [CustomerReview],
                included: [CustomerReviewResponseV1]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([CustomerReview].self, forKey: "data")
        included = try container.decodeIfPresent([CustomerReviewResponseV1].self, forKey: "included")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }

    public func getResponse(for customerReview: CustomerReview) -> CustomerReviewResponseV1? {
        included?.first { $0.id == customerReview.relationships?.response?.data?.id }
    }
}
