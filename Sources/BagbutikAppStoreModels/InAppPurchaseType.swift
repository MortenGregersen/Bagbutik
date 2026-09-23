import BagbutikCore
import Foundation

/**
 # InAppPurchaseType

 A string that represents the type of an In-App Purchase.

 ```
 string InAppPurchaseType
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchasetype>
 */
public enum InAppPurchaseType: String, Sendable, ParameterValue, Codable, CaseIterable {
    case consumable = "CONSUMABLE"
    case nonConsumable = "NON_CONSUMABLE"
    case nonRenewingSubscription = "NON_RENEWING_SUBSCRIPTION"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = InAppPurchaseType(rawValue: string) {
            self = value
        } else if let value = InAppPurchaseType(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid InAppPurchaseType value: \(string)"
            )
        }
    }
}
