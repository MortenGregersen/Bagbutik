import BagbutikCore
import Foundation

/**
 # SubscriptionEqualizedPriceTiersForTerritory

 The equalized volume pricing tiers for a single territory.

 ```
 object SubscriptionEqualizedPriceTiersForTerritory
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionequalizedpricetiersforterritory>
 */
public struct SubscriptionEqualizedPriceTiersForTerritory: Codable, Sendable {
    public var additionalPriceTiers: [ProposedSubscriptionPriceTier]?
    public var basePricePointId: String?
    public var territoryId: String?

    public init(additionalPriceTiers: [ProposedSubscriptionPriceTier]? = nil,
                basePricePointId: String? = nil,
                territoryId: String? = nil)
    {
        self.additionalPriceTiers = additionalPriceTiers
        self.basePricePointId = basePricePointId
        self.territoryId = territoryId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        additionalPriceTiers = try container.decodeIfPresent([ProposedSubscriptionPriceTier].self, forKey: "additionalPriceTiers")
        basePricePointId = try container.decodeIfPresent(String.self, forKey: "basePricePointId")
        territoryId = try container.decodeIfPresent(String.self, forKey: "territoryId")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(additionalPriceTiers, forKey: "additionalPriceTiers")
        try container.encodeIfPresent(basePricePointId, forKey: "basePricePointId")
        try container.encodeIfPresent(territoryId, forKey: "territoryId")
    }
}
