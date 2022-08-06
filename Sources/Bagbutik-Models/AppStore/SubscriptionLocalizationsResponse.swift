import Bagbutik_Core
import Foundation

public struct SubscriptionLocalizationsResponse: Codable, PagedResponse {
    public typealias Data = SubscriptionLocalization

    public let data: [SubscriptionLocalization]
    public var included: [Subscription]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [SubscriptionLocalization],
                included: [Subscription]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
