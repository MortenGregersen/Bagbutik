import Bagbutik_Core
import Foundation

public struct BetaGroupsWithoutIncludesResponse: Codable, PagedResponse {
    public typealias Data = BetaGroup

    public let data: [BetaGroup]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [BetaGroup],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
