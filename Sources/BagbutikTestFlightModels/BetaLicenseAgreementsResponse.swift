import BagbutikCore
import BagbutikModelsShared
import Foundation

/**
 # BetaLicenseAgreementsResponse

 The response body for endpoints that list TestFlight license agreements.

 ```
 object BetaLicenseAgreementsResponse
 ```

 ## See Also

 [`List beta license agreements`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-betaLicenseAgreements)

 Find and list beta license agreements for all apps.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betalicenseagreementsresponse>
 */
public struct BetaLicenseAgreementsResponse: Codable, Sendable, PagedResponse {
    public typealias Data = BetaLicenseAgreement

    public let data: [BetaLicenseAgreement]
    public var included: [App]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [BetaLicenseAgreement],
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
        data = try container.decode([BetaLicenseAgreement].self, forKey: "data")
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

    public func getApp(for betaLicenseAgreement: BetaLicenseAgreement) -> App? {
        included?.first { $0.id == betaLicenseAgreement.relationships?.app?.data?.id }
    }
}
