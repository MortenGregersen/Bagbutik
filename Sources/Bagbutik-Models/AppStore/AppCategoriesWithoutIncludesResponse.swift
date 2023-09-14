import Bagbutik_Core
import Foundation

public struct AppCategoriesWithoutIncludesResponse: Codable, PagedResponse {
    public typealias Data = AppCategory

    public let data: [AppCategory]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppCategory],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
