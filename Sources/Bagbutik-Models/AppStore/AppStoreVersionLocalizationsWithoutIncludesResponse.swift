import Bagbutik_Core
import Foundation

public struct AppStoreVersionLocalizationsWithoutIncludesResponse: Codable, PagedResponse {
    public typealias Data = AppStoreVersionLocalization

    public let data: [AppStoreVersionLocalization]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AppStoreVersionLocalization],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
