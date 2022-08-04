import Foundation
import Bagbutik_Core

public struct InAppPurchasePricePointsResponse: Codable, PagedResponse {
    public typealias Data = InAppPurchasePricePoint

    public let data: [InAppPurchasePricePoint]
    public var included: [Territory]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [InAppPurchasePricePoint],
                included: [Territory]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
