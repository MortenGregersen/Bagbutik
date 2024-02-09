import Bagbutik_Core
import Foundation

/**
 # MarketplaceDomainsResponse
 A response that contains a list of alternative marketplace domain resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/marketplacedomainsresponse>
 */
public struct MarketplaceDomainsResponse: Codable, PagedResponse {
    public typealias Data = MarketplaceDomain

    public let data: [MarketplaceDomain]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [MarketplaceDomain],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }
}
