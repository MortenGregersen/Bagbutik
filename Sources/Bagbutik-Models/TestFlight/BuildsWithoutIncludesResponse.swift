import Bagbutik_Core
import Foundation

public struct BuildsWithoutIncludesResponse: Codable, PagedResponse {
    public typealias Data = Build

    public let data: [Build]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [Build],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
