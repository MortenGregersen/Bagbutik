import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # WebhookPingResponse
 A response that contains a single webhook ping response resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/webhookpingresponse>
 */
public struct WebhookPingResponse: Codable, Sendable {
    public let data: WebhookPing
    public let links: DocumentLinks

    public init(data: WebhookPing,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(WebhookPing.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
