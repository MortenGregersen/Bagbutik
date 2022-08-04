import Foundation
import Bagbutik_Core

public struct SubscriptionPricePointsResponse: Codable, PagedResponse {
    public typealias Data = SubscriptionPricePoint

    public let data: [SubscriptionPricePoint]
    public var included: [Territory]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [SubscriptionPricePoint],
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
