import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AppTagsResponse
 A response that contains a list of app tags response resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apptagsresponse>
 */
public struct AppTagsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = AppTag

    public let data: [AppTag]
    public var included: [Territory]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppTag],
                included: [Territory]? = nil,
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
        data = try container.decode([AppTag].self, forKey: "data")
        included = try container.decodeIfPresent([Territory].self, forKey: "included")
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

    public func getTerritories(for appTag: AppTag) -> [Territory] {
        guard let territoryIds = appTag.relationships?.territories?.data?.map(\.id) else { return [] }
        return included?.filter { territoryIds.contains($0.id) } ?? []
    }
}
