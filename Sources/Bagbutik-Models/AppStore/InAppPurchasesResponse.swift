import Bagbutik_Core
import Foundation

/**
 # InAppPurchasesResponse
 A response that contains a list of In-App Purchases resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchasesresponse>
 */
public struct InAppPurchasesResponse: Codable, PagedResponse {
    public typealias Data = InAppPurchase

    public let data: [InAppPurchase]
    public var included: [App]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [InAppPurchase],
                included: [App]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
