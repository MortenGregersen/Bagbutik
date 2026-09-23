import BagbutikCore
import BagbutikModelsShared
import Foundation

/**
 # BetaAppLocalizationResponse

 The response body for endpoints that create, read, or modify localized TestFlight app metadata.

 ```
 object BetaAppLocalizationResponse
 ```

 ## See Also

 [`Create a beta app localization`](https://developer.apple.com/documentation/AppStoreConnectAPI/POST-v1-betaAppLocalizations)

 Create localized descriptive information for an app.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaapplocalizationresponse>
 */
public struct BetaAppLocalizationResponse: Codable, Sendable {
    public let data: BetaAppLocalization
    public var included: [App]?
    public let links: DocumentLinks

    public init(data: BetaAppLocalization,
                included: [App]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BetaAppLocalization.self, forKey: "data")
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
