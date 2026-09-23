import BagbutikCore
import BagbutikModelsShared
import Foundation

/**
 # BetaLicenseAgreementResponse

 The response body for endpoints that read or modify the TestFlight license agreement for an app.

 ```
 object BetaLicenseAgreementResponse
 ```

 ## See Also

 [`Read the beta license agreement of an app`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-apps-_id_-betaLicenseAgreement)

 Get the beta license agreement for a specific app.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betalicenseagreementresponse>
 */
public struct BetaLicenseAgreementResponse: Codable, Sendable {
    public let data: BetaLicenseAgreement
    public var included: [App]?
    public let links: DocumentLinks

    public init(data: BetaLicenseAgreement,
                included: [App]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BetaLicenseAgreement.self, forKey: "data")
        included = try container.decodeIfPresent([App].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
