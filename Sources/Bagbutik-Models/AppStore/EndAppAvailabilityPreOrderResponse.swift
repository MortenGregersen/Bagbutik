import Bagbutik_Core
import Foundation

/**
 # EndAppAvailabilityPreOrderResponse
 A response that contains a single end app availability resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/endappavailabilitypreorderresponse>
 */
public struct EndAppAvailabilityPreOrderResponse: Codable {
    public let data: EndAppAvailabilityPreOrder
    public let links: DocumentLinks

    public init(data: EndAppAvailabilityPreOrder,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(EndAppAvailabilityPreOrder.self, forKey: .data)
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
