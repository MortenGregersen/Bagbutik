import Bagbutik_Core
import Foundation

/**
 # CustomerReviewResponseV1Response
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

    public init(data: CustomerReviewResponseV1,
                included: [CustomerReview]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(CustomerReviewResponseV1.self, forKey: .data)
        included = try container.decodeIfPresent([CustomerReview].self, forKey: .included)
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
