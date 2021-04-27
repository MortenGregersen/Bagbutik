import Foundation

/**
 A response that contains a single App Prices resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppriceresponse>
 */
public struct AppPriceResponse: Codable {
    /// The resource data.
    public let data: AppPrice
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppPrice, links: DocumentLinks) {
        self.data = data
        self.links = links
    }
}
