import Bagbutik_Core
import Foundation

public struct InAppPurchaseLocalizationsResponse: Codable, PagedResponse {
    public typealias Data = InAppPurchaseLocalization

    public let data: [InAppPurchaseLocalization]
    public var included: [InAppPurchaseV2]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [InAppPurchaseLocalization],
                included: [InAppPurchaseV2]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
