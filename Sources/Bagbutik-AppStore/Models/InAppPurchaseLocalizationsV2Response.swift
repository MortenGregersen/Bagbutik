import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # InAppPurchaseLocalizationsV2Response
 The response body for endpoints that list in-app purchase localizations configured with the v2 API.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchaselocalizationsv2response>
 */
public struct InAppPurchaseLocalizationsV2Response: Codable, Sendable, PagedResponse {
    public typealias Data = InAppPurchaseLocalizationV2

    public let data: [InAppPurchaseLocalizationV2]
    public var included: [InAppPurchaseVersion]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [InAppPurchaseLocalizationV2],
                included: [InAppPurchaseVersion]? = nil,
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
        data = try container.decode([InAppPurchaseLocalizationV2].self, forKey: "data")
        included = try container.decodeIfPresent([InAppPurchaseVersion].self, forKey: "included")
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

    public func getVersion(for inAppPurchaseLocalizationV2: InAppPurchaseLocalizationV2) -> InAppPurchaseVersion? {
        included?.first { $0.id == inAppPurchaseLocalizationV2.relationships?.version?.data?.id }
    }
}
