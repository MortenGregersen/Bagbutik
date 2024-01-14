import Bagbutik_Core
import Foundation

public struct BetaAppLocalizationsWithoutIncludesResponse: Codable, PagedResponse {
    public typealias Data = BetaAppLocalization

    public let data: [BetaAppLocalization]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [BetaAppLocalization],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
