import Foundation

/**
 # WebhookResponse
 A response that contains a single webhook response resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/webhookresponse>
 */
public struct WebhookResponse: Codable, Sendable {
    public let data: Webhook
    public var included: [App]?
    public let links: DocumentLinks

    public init(data: Webhook,
                included: [App]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Webhook.self, forKey: "data")
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
