import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # SubscriptionGroupLocalizationsV2Response
 The response body for endpoints that list subscription group localizations configured with the v2 API.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptiongrouplocalizationsv2response>
 */
public struct SubscriptionGroupLocalizationsV2Response: Codable, Sendable, PagedResponse {
    public typealias Data = SubscriptionGroupLocalizationV2

    public let data: [SubscriptionGroupLocalizationV2]
    public var included: [SubscriptionGroupVersion]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [SubscriptionGroupLocalizationV2],
                included: [SubscriptionGroupVersion]? = nil,
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
        data = try container.decode([SubscriptionGroupLocalizationV2].self, forKey: "data")
        included = try container.decodeIfPresent([SubscriptionGroupVersion].self, forKey: "included")
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

    public func getVersion(for subscriptionGroupLocalizationV2: SubscriptionGroupLocalizationV2) -> SubscriptionGroupVersion? {
        included?.first { $0.id == subscriptionGroupLocalizationV2.relationships?.version?.data?.id }
    }
}
