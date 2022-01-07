import Foundation

/**
 A response that contains a single In-App Purchases resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchaseresponse>
 */
public struct InAppPurchaseResponse: Codable {
    /// The resource data.
    public let data: InAppPurchase
    /// The included related resources.
    @NullCodable public var included: [App]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: InAppPurchase, included: [App]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
