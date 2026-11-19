import BagbutikCore
import Foundation

/**
 # SubscriptionPriceChangePreviewResponse

 The response body for endpoints that create a subscription price change preview.

 ```
 object SubscriptionPriceChangePreviewResponse
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionpricechangepreviewresponse>
 */
public struct SubscriptionPriceChangePreviewResponse: Codable, Sendable {
    public let data: SubscriptionPriceChangePreview
    public let links: DocumentLinks

    public init(data: SubscriptionPriceChangePreview,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(SubscriptionPriceChangePreview.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
