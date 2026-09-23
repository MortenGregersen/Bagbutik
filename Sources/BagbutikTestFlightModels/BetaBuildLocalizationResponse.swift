import BagbutikCore
import BagbutikModelsShared
import Foundation

/**
 # BetaBuildLocalizationResponse

 The response body for endpoints that create, read, or modify localized TestFlight build metadata.

 ```
 object BetaBuildLocalizationResponse
 ```

 ## See Also

 [`Create a beta build localization`](https://developer.apple.com/documentation/AppStoreConnectAPI/POST-v1-betaBuildLocalizations)

 Create localized What’s New text for a build.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betabuildlocalizationresponse>
 */
public struct BetaBuildLocalizationResponse: Codable, Sendable {
    public let data: BetaBuildLocalization
    public var included: [Build]?
    public let links: DocumentLinks

    public init(data: BetaBuildLocalization,
                included: [Build]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(BetaBuildLocalization.self, forKey: "data")
        included = try container.decodeIfPresent([Build].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
