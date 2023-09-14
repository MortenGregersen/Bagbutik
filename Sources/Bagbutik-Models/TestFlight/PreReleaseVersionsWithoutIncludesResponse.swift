import Bagbutik_Core
import Foundation

public struct PreReleaseVersionsWithoutIncludesResponse: Codable, PagedResponse {
    public typealias Data = App

    public let data: [App]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [App],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
