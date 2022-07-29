import Foundation

public struct SubscriptionGroupLocalizationsResponse: Codable, PagedResponse {
    public typealias Data = SubscriptionGroupLocalization

    public let data: [SubscriptionGroupLocalization]
    public var included: [SubscriptionGroup]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [SubscriptionGroupLocalization],
                included: [SubscriptionGroup]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
