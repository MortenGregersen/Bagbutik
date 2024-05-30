import Bagbutik_Core
import Foundation

/**
 # MarketplaceSearchDetailResponse
 A response that contains a single alternative marketplace search detail resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/marketplacesearchdetailresponse>
 */
public struct MarketplaceSearchDetailResponse: Codable {
    public let data: MarketplaceSearchDetail
    public let links: DocumentLinks

    public init(data: MarketplaceSearchDetail,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(MarketplaceSearchDetail.self, forKey: .data)
        links = try container.decode(DocumentLinks.self, forKey: .links)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
        try container.encode(links, forKey: .links)
    }

    private enum CodingKeys: String, CodingKey {
        case data
        case links
    }
}
