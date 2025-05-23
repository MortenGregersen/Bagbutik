import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BetaAppReviewDetailsResponse
 A response that contains a list of Beta App Review Detail resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappreviewdetailsresponse>
 */
public struct BetaAppReviewDetailsResponse: Codable, Sendable, PagedResponse {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([BetaAppReviewDetail].self, forKey: "data")
        included = try container.decodeIfPresent([App].self, forKey: "included")
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

    public func getApp(for betaAppReviewDetail: BetaAppReviewDetail) -> App? {
        included?.first { $0.id == betaAppReviewDetail.relationships?.app?.data?.id }
    }
}
