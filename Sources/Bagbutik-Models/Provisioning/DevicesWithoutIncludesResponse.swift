import Bagbutik_Core
import Foundation

public struct DevicesWithoutIncludesResponse: Codable, PagedResponse {
    public typealias Data = Device

    public let data: [Device]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [Device],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
