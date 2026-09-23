import BagbutikCore
import Foundation

/**
 # InAppPurchaseImagesV2Response

 The response body for endpoints that list In-App Purchase images configured with the v2 API.

 ```
 object InAppPurchaseImagesV2Response
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchaseimagesv2response>
 */
public struct InAppPurchaseImagesV2Response: Codable, Sendable, PagedResponse {
    public typealias Data = InAppPurchaseImageV2

    public let data: [InAppPurchaseImageV2]
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [InAppPurchaseImageV2],
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([InAppPurchaseImageV2].self, forKey: "data")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }
}
