import Bagbutik_Core
import Foundation

/**
 # AppPreOrderResponse
 A response that contains a single App Pre-Orders resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppreorderresponse>
 */
public struct AppPreOrderResponse: Codable {
    public let data: AppPreOrder
    public var included: [App]?
    public let links: DocumentLinks

    public init(data: AppPreOrder,
                included: [App]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppPreOrder.self, forKey: "data")
        included = try container.decodeIfPresent([App].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
