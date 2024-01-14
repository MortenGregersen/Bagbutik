import Bagbutik_Core
import Foundation

public struct PreReleaseVersionsWithoutIncludesResponse: Codable, PagedResponse {
    public typealias Data = PrereleaseVersion

    public let data: [PrereleaseVersion]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [PrereleaseVersion],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
