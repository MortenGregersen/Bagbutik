import Foundation

/**
 A response that contains a list of In-App Purchase resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchasesresponse>
 */
public struct InAppPurchasesResponse: Codable, PagedResponse {
    public typealias Data = InAppPurchase
    /// The resource data.
    public let data: [InAppPurchase]
    /// The included related resources.
    @NullCodable public var included: [App]?
    /// Navigational links that include the self-link.
    public let links: PagedDocumentLinks
    /// Paging information.
    @NullCodable public var meta: PagingInformation?

    public init(data: [InAppPurchase], included: [App]? = nil, links: PagedDocumentLinks, meta: PagingInformation? = nil) {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }
}
