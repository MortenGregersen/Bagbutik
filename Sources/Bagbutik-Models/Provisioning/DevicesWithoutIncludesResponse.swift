import Bagbutik_Core
import Foundation

public struct DevicesWithoutIncludesResponse: Codable, PagedResponse {
    public typealias Data = Profile

    public let data: [Profile]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [Profile],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
