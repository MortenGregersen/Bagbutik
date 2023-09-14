import Bagbutik_Core
import Foundation

public struct TerritoriesWithoutIncludesResponse: Codable, PagedResponse {
    public typealias Data = EndUserLicenseAgreement

    public let data: [EndUserLicenseAgreement]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [EndUserLicenseAgreement],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
