import Foundation

/**
 A response that contains a single App Price Tiers resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppricetierresponse>
 */
public struct AppPriceTierResponse: Codable {
    /// The resource data.
    public let data: AppPriceTier
    /// The included related resources.
    @NullCodable public var included: [AppPricePoint]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppPriceTier, included: [AppPricePoint]? = nil, links: DocumentLinks) {
        self.data = data
        self.included = included
        self.links = links
    }
}
