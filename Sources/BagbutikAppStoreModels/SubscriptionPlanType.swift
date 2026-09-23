import BagbutikCore
import Foundation

/**
 # SubscriptionPlanType

 A string that indicates the billing plan type for an auto-renewable subscription.

 ```
 string SubscriptionPlanType
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionplantype>
 */
public enum SubscriptionPlanType: String, Sendable, ParameterValue, Codable, CaseIterable {
    case monthly = "MONTHLY"
    case upfront = "UPFRONT"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = SubscriptionPlanType(rawValue: string) {
            self = value
        } else if let value = SubscriptionPlanType(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid SubscriptionPlanType value: \(string)"
            )
        }
    }
}
