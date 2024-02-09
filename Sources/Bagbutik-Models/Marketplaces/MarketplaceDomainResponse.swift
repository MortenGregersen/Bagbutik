import Bagbutik_Core
import Foundation

/**
 # MarketplaceDomainResponse
 A response that contains a single alternative marketplace domain resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/marketplacedomainresponse>
 */
public struct MarketplaceDomainResponse: Codable {
    public let data: MarketplaceDomain
    public let links: DocumentLinks

    public init(data: MarketplaceDomain,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
