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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(CustomerReview.self, forKey: .data)
        included = try container.decodeIfPresent([CustomerReviewResponseV1].self, forKey: .included)
        links = try container.decode(DocumentLinks.self, forKey: .links)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encodeIfPresent(included, forKey: .included)
        try container.encode(links, forKey: .links)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case included
        case links
    }
}
