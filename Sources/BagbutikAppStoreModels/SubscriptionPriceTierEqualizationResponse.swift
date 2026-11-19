import BagbutikCore
import Foundation

/**
 # SubscriptionPriceTierEqualizationResponse

 The response body for endpoints that create a subscription price tier equalization.

 ```
 object SubscriptionPriceTierEqualizationResponse
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionpricetierequalizationresponse>
 */
public struct SubscriptionPriceTierEqualizationResponse: Codable, Sendable {
    public let data: SubscriptionPriceTierEqualization
    public var included: [SubscriptionPricePoint]?
    public let links: DocumentLinks

    public init(data: SubscriptionPriceTierEqualization,
                included: [SubscriptionPricePoint]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(SubscriptionPriceTierEqualization.self, forKey: "data")
        included = try container.decodeIfPresent([SubscriptionPricePoint].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
