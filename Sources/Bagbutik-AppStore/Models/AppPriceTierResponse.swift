import Bagbutik_Core
import Foundation

/**
 # AppPriceTierResponse
 A response that contains a single App Price Tier resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppricetierresponse>
 */
public struct AppPriceTierResponse: Codable {
    /// The resource data.
    public let data: AppPriceTier
    /// The requested relationship data. Note: `AppPricePoint` is deprecated.
    public var included: [AppPricePoint]?
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: AppPriceTier,
                included: [AppPricePoint]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }
}
