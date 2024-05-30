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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(AppPriceTier.self, forKey: .data)
        included = try container.decodeIfPresent([AppPricePoint].self, forKey: .included)
        links = try container.decode(DocumentLinks.self, forKey: .links)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encodeIfPresent(included, forKey: .included)
        try container.encode(links, forKey: .links)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case included
        case links
    }
}
