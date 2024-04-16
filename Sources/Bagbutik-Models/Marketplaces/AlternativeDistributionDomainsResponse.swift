import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionDomainsResponse
 A response that contains a list of alternative distribution domain resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributiondomainsresponse>
 */
public struct AlternativeDistributionDomainsResponse: Codable, PagedResponse {
    public typealias Data = AlternativeDistributionDomain

    public let data: [AlternativeDistributionDomain]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AlternativeDistributionDomain],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
