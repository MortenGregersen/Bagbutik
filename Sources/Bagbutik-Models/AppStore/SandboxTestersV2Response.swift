import Bagbutik_Core
import Foundation

public struct SandboxTestersV2Response: Codable, PagedResponse {
    public typealias Data = SandboxTesterV2

    public let data: [SandboxTesterV2]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [SandboxTesterV2],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
