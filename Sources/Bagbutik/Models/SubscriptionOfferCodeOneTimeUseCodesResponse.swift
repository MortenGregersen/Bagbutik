import Foundation

public struct SubscriptionOfferCodeOneTimeUseCodesResponse: Codable, PagedResponse {
    public typealias Data = SubscriptionOfferCodeOneTimeUseCode
    public let data: [SubscriptionOfferCodeOneTimeUseCode]
    public var included: [SubscriptionOfferCode]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [SubscriptionOfferCodeOneTimeUseCode], included: [SubscriptionOfferCode]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
