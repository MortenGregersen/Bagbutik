import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # InAppPurchaseImageV2Response
 The response body for endpoints that create, read, or modify an in-app purchase image with the v2 API.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchaseimagev2response>
 */
public struct InAppPurchaseImageV2Response: Codable, Sendable {
    public let data: InAppPurchaseImageV2
    public let links: DocumentLinks

    public init(data: InAppPurchaseImageV2,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(InAppPurchaseImageV2.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
