import Bagbutik_Core
import Foundation

/**
 # CiBuildActionsResponse
 A response that contains a list of Build Actions resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cibuildactionsresponse>
 */
public struct CiBuildActionsResponse: Codable, PagedResponse {
    public typealias Data = CiBuildAction

    /// The resource data.
    public let data: [CiBuildAction]
    /// The requested relationship data.
    public var included: [CiBuildRun]?
    /// The navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// The paging information.
    public var meta: PagingInformation?

    public init(data: [CiBuildAction],
                included: [CiBuildRun]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode([CiBuildAction].self, forKey: .data)
        included = try container.decodeIfPresent([CiBuildRun].self, forKey: .included)
        links = try container.decode(PagedDocumentLinks.self, forKey: .links)
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encodeIfPresent(included, forKey: .included)
        try container.encode(links, forKey: .links)
        try container.encodeIfPresent(meta, forKey: .meta)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case included
        case links
        case meta
    }
}
