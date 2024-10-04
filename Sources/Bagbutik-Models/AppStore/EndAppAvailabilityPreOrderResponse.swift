import Bagbutik_Core
import Foundation

/**
 # EndAppAvailabilityPreOrderResponse
 A response that contains a single end app availability resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/endappavailabilitypreorderresponse>
 */
public struct EndAppAvailabilityPreOrderResponse: Codable, Sendable {
    public let data: EndAppAvailabilityPreOrder
    public let links: DocumentLinks

    public init(data: EndAppAvailabilityPreOrder,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(EndAppAvailabilityPreOrder.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
