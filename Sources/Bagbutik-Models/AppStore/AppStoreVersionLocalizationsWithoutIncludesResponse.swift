import Bagbutik_Core
import Foundation

public struct AppStoreVersionLocalizationsWithoutIncludesResponse: Codable, PagedResponse {
    public typealias Data = AppStoreVersion

    public let data: [AppStoreVersion]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppStoreVersion],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
