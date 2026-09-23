import BagbutikCore
import BagbutikModelsShared
import Foundation

/**
 # BetaAppLocalizationsResponse

 The response body for endpoints that list localized TestFlight app metadata entries.

 ```
 object BetaAppLocalizationsResponse
 ```

 ## See Also

 [`List beta app localizations`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-betaAppLocalizations)

 Find and list beta app localizations for all apps and locales.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalizationsresponse>
 */
public struct BetaAppLocalizationsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = BetaAppLocalization

    public let data: [BetaAppLocalization]
    public var included: [App]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [BetaAppLocalization],
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
        data = try container.decode([BetaAppLocalization].self, forKey: "data")
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

    public func getApp(for betaAppLocalization: BetaAppLocalization) -> App? {
        included?.first { $0.id == betaAppLocalization.relationships?.app?.data?.id }
    }
}
