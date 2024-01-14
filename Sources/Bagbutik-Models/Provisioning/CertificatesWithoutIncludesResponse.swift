import Bagbutik_Core
import Foundation

public struct CertificatesWithoutIncludesResponse: Codable, PagedResponse {
    public typealias Data = Certificate

    public let data: [Certificate]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [Certificate],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
