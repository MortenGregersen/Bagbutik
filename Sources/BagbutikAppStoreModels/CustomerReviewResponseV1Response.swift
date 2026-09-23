import BagbutikCore
import Foundation

/**
 # CustomerReviewResponseV1Response

 The response body for endpoints that create, read, or modify a developer’s response to a customer review.

 ```
 object CustomerReviewResponseV1Response
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/customerreviewresponsev1response>
 */
public struct CustomerReviewResponseV1Response: Codable, Sendable {
    public let data: CustomerReviewResponseV1
    public var included: [CustomerReview]?
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
