import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # MarketplaceDomainResponse
 A response that contains a single alternative marketplace domain resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/marketplacedomainresponse>
 */
public struct MarketplaceDomainResponse: Codable, Sendable {
    public let data: MarketplaceDomain
    public let links: DocumentLinks

    public init(data: MarketplaceDomain,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(MarketplaceDomain.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
