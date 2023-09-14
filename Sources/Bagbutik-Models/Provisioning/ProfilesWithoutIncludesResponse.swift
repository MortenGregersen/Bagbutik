import Bagbutik_Core
import Foundation

public struct ProfilesWithoutIncludesResponse: Codable, PagedResponse {
    public typealias Data = BundleId

    public let data: [BundleId]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [BundleId],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
