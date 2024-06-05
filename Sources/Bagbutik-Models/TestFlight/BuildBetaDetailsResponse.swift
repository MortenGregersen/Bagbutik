import Bagbutik_Core
import Foundation

/**
 # BuildBetaDetailsResponse
 A response that contains a list of Build Beta Detail resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildbetadetailsresponse>
 */
public struct BuildBetaDetailsResponse: Codable, PagedResponse {
    public typealias Data = BuildBetaDetail

    /// The resource data.
    public let data: [BuildBetaDetail]
    public var included: [Build]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    public var meta: PagingInformation?

    public init(data: [BuildBetaDetail],
                included: [Build]? = nil,
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
        data = try container.decode([BuildBetaDetail].self, forKey: "data")
        included = try container.decodeIfPresent([Build].self, forKey: "included")
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
}
