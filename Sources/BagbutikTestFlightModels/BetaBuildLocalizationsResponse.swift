import BagbutikCore
import BagbutikModelsShared
import Foundation

/**
 # BetaBuildLocalizationsResponse

 The response body for endpoints that list localized TestFlight build metadata entries.

 ```
 object BetaBuildLocalizationsResponse
 ```

 ## See Also

 [`List beta build localizations`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-betaBuildLocalizations)

 Find and list beta build localizations currently associated with apps.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalizationsresponse>
 */
public struct BetaBuildLocalizationsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = BetaBuildLocalization

    public let data: [BetaBuildLocalization]
    public var included: [Build]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [BetaBuildLocalization],
                included: [Build]? = nil,
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
        data = try container.decode([BetaBuildLocalization].self, forKey: "data")
        included = try container.decodeIfPresent([Build].self, forKey: "included")
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

    public func getBuild(for betaBuildLocalization: BetaBuildLocalization) -> Build? {
        included?.first { $0.id == betaBuildLocalization.relationships?.build?.data?.id }
    }
}
