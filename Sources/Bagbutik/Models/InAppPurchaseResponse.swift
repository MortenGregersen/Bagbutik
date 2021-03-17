import Foundation

/**
 A response that contains a single In-App Purchases resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchaseresponse>
 */
public struct InAppPurchaseResponse: Codable {
    /// The resource data.
    public let data: InAppPurchase
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: InAppPurchase, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
