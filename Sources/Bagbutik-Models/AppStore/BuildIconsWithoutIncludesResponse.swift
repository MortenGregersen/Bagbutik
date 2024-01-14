import Bagbutik_Core
import Foundation

public struct BuildIconsWithoutIncludesResponse: Codable, PagedResponse {
    public typealias Data = BuildIcon

    public let data: [BuildIcon]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [BuildIcon],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
