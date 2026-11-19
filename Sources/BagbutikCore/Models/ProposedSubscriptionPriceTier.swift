import Foundation

/**
 # ProposedSubscriptionPriceTier

 A volume pricing tier that you propose for a territory.

 ```
 object ProposedSubscriptionPriceTier
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/proposedsubscriptionpricetier>
 */
public struct ProposedSubscriptionPriceTier: Codable, Sendable {
    public let minQuantity: Int
    public let subscriptionPricePointId: String

    public init(minQuantity: Int,
                subscriptionPricePointId: String)
    {
        self.minQuantity = minQuantity
        self.subscriptionPricePointId = subscriptionPricePointId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        minQuantity = try container.decode(Int.self, forKey: "minQuantity")
        subscriptionPricePointId = try container.decode(String.self, forKey: "subscriptionPricePointId")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(minQuantity, forKey: "minQuantity")
        try container.encode(subscriptionPricePointId, forKey: "subscriptionPricePointId")
    }
}
