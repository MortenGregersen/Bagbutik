import BagbutikCore
import Foundation

/**
 # InAppPurchaseOfferCodeOneTimeUseCodeResponse

 A response that contains a single In-App Purchase offer code one-time use code resource.

 ```
 object InAppPurchaseOfferCodeOneTimeUseCodeResponse
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchaseoffercodeonetimeusecoderesponse>
 */
public struct InAppPurchaseOfferCodeOneTimeUseCodeResponse: Codable, Sendable {
    public let data: InAppPurchaseOfferCodeOneTimeUseCode
    public var included: [Actor]?
    public let links: DocumentLinks

    public init(data: InAppPurchaseOfferCodeOneTimeUseCode,
                included: [Actor]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(InAppPurchaseOfferCodeOneTimeUseCode.self, forKey: "data")
        included = try container.decodeIfPresent([Actor].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
