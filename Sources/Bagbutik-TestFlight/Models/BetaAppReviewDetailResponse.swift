import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BetaAppReviewDetailResponse
 The response body for endpoints that read or modify the beta review contact and demo details for an app.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappreviewdetailresponse>
 */
public struct BetaAppReviewDetailResponse: Codable, Sendable {
    /// The resource data.
    public let data: BetaAppReviewDetail
    public var included: [App]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: BetaAppReviewDetail,
                included: [App]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BetaAppReviewDetail.self, forKey: "data")
        included = try container.decodeIfPresent([App].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
