import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # SubscriptionImageV2Response
 The response body for endpoints that create, read, or modify a subscription image with the v2 API.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionimagev2response>
 */
public struct SubscriptionImageV2Response: Codable, Sendable {
    public let data: SubscriptionImageV2
    public let links: DocumentLinks

    public init(data: SubscriptionImageV2,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(SubscriptionImageV2.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
