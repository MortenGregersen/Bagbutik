import Bagbutik_Core
import Foundation

public struct BetaBuildLocalizationsWithoutIncludesResponse: Codable, PagedResponse {
    public typealias Data = BetaBuildLocalization

    public let data: [BetaBuildLocalization]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [BetaBuildLocalization],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
