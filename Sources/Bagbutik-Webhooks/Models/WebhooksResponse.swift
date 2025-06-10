import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # WebhooksResponse
 A response that contains a list of webhooks response resources.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/webhooksresponse>
 */
public struct WebhooksResponse: Codable, Sendable, PagedResponse {
    public typealias Data = Webhook

    public let data: [Webhook]
    public var included: [App]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [Webhook],
                included: [App]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([Webhook].self, forKey: "data")
        included = try container.decodeIfPresent([App].self, forKey: "included")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }

    public func getApp(for webhook: Webhook) -> App? {
        included?.first { $0.id == webhook.relationships?.app?.data?.id }
    }
}
