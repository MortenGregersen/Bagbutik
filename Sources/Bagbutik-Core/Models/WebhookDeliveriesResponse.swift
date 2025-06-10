import Foundation

/**
 # WebhookDeliveriesResponse
 A response that contains a list of response resources for webhook deliveries.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/webhookdeliveriesresponse>
 */
public struct WebhookDeliveriesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = WebhookDelivery

    public let data: [WebhookDelivery]
    public var included: [WebhookEvent]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [WebhookDelivery],
                included: [WebhookEvent]? = nil,
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
        data = try container.decode([WebhookDelivery].self, forKey: "data")
        included = try container.decodeIfPresent([WebhookEvent].self, forKey: "included")
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

    public func getEvent(for webhookDelivery: WebhookDelivery) -> WebhookEvent? {
        included?.first { $0.id == webhookDelivery.relationships?.event?.data?.id }
    }
}
