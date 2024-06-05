import Bagbutik_Core
import Foundation

public struct SubscriptionGroupLocalizationsResponse: Codable, PagedResponse {
    public typealias Data = SubscriptionGroupLocalization

    public let data: [SubscriptionGroupLocalization]
    public var included: [SubscriptionGroup]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [SubscriptionGroupLocalization],
                included: [SubscriptionGroup]? = nil,
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
        data = try container.decode([SubscriptionGroupLocalization].self, forKey: "data")
        included = try container.decodeIfPresent([SubscriptionGroup].self, forKey: "included")
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
}
