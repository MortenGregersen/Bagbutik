import Bagbutik_Core
import Foundation

public struct SubscriptionOfferCodeCustomCodesResponse: Codable, PagedResponse {
    public typealias Data = SubscriptionOfferCodeCustomCode

    public let data: [SubscriptionOfferCodeCustomCode]
    public var included: [SubscriptionOfferCode]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [SubscriptionOfferCodeCustomCode],
                included: [SubscriptionOfferCode]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
