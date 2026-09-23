import BagbutikCore
import Foundation

/**
 # InAppPurchaseOfferCodeCustomCodeResponse

 A response that contains a single In-App Purchase offer code custom code resource.

 ```
 object InAppPurchaseOfferCodeCustomCodeResponse
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchaseoffercodecustomcoderesponse>
 */
public struct InAppPurchaseOfferCodeCustomCodeResponse: Codable, Sendable {
    public let data: InAppPurchaseOfferCodeCustomCode
    public var included: [Actor]?
    public let links: DocumentLinks

    public init(data: InAppPurchaseOfferCodeCustomCode,
                included: [Actor]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(InAppPurchaseOfferCodeCustomCode.self, forKey: "data")
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
