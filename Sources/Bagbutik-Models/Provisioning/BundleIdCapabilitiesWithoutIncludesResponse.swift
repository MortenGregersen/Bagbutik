import Bagbutik_Core
import Foundation

public struct BundleIdCapabilitiesWithoutIncludesResponse: Codable, PagedResponse {
    public typealias Data = BundleIdCapability

    public let data: [BundleIdCapability]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [BundleIdCapability],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
