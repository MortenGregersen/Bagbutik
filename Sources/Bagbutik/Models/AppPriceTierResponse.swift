import Foundation

/// A response that contains a single App Price Tiers resource.
public struct AppPriceTierResponse: Codable {
    /// The resource data.
    public let data: AppPriceTier
    public let included: [AppPricePoint]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppPriceTier, included: [AppPricePoint]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
