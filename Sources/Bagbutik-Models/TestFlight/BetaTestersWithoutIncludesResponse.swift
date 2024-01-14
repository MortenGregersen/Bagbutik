import Bagbutik_Core
import Foundation

public struct BetaTestersWithoutIncludesResponse: Codable, PagedResponse {
    public typealias Data = BetaTester

    public let data: [BetaTester]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [BetaTester],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
