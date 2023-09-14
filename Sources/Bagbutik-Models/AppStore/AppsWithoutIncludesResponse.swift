import Bagbutik_Core
import Foundation

public struct AppsWithoutIncludesResponse: Codable, PagedResponse {
    public typealias Data = User

    public let data: [User]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [User],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
