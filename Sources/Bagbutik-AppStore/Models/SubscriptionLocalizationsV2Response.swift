import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # SubscriptionLocalizationsV2Response
 The response body for endpoints that list subscription localizations configured with the v2 API.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionlocalizationsv2response>
 */
public struct SubscriptionLocalizationsV2Response: Codable, Sendable, PagedResponse {
    public typealias Data = SubscriptionLocalizationV2

    public let data: [SubscriptionLocalizationV2]
    public var included: [SubscriptionVersion]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [SubscriptionLocalizationV2],
                included: [SubscriptionVersion]? = nil,
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
        data = try container.decode([SubscriptionLocalizationV2].self, forKey: "data")
        included = try container.decodeIfPresent([SubscriptionVersion].self, forKey: "included")
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

    public func getVersion(for subscriptionLocalizationV2: SubscriptionLocalizationV2) -> SubscriptionVersion? {
        included?.first { $0.id == subscriptionLocalizationV2.relationships?.version?.data?.id }
    }
}
