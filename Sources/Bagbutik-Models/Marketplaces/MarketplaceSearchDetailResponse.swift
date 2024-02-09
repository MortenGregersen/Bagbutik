import Bagbutik_Core
import Foundation

/**
 # MarketplaceSearchDetailResponse
 A response that contains a single alternative marketplace search detail resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/marketplacesearchdetailresponse>
 */
public struct MarketplaceSearchDetailResponse: Codable {
    public let data: MarketplaceSearchDetail
    public let links: DocumentLinks

    public init(data: MarketplaceSearchDetail,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
