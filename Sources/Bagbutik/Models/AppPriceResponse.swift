import Foundation

/// A response that contains a single App Prices resource.
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
