import Bagbutik_Core
import Foundation

public struct TerritoriesWithoutIncludesResponse: Codable, PagedResponse {
    public typealias Data = Territory

    public let data: [Territory]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [Territory],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
