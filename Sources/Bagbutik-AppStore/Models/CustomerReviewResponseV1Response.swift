import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # CustomerReviewResponseV1Response
 The response body for endpoints that create, read, or modify a developer’s response to a customer review.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/customerreviewresponsev1response>
 */
public struct CustomerReviewResponseV1Response: Codable, Sendable {
    /// The data structure that represents a `CustomerReviewResponses` resource.
    public let data: CustomerReviewResponseV1
    /// The requested relationship data.
    public var included: [CustomerReview]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: CustomerReviewResponseV1,
                included: [CustomerReview]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(CustomerReviewResponseV1.self, forKey: "data")
        included = try container.decodeIfPresent([CustomerReview].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
