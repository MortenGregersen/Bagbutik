import BagbutikCore
import Foundation

/**
 # SubscriptionGracePeriodDuration

 A string that represents the grace period duration for a subscription.

 ```
 string SubscriptionGracePeriodDuration
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptiongraceperiodduration>
 */
public enum SubscriptionGracePeriodDuration: String, Sendable, Codable, CaseIterable {
    case sixteenDays = "SIXTEEN_DAYS"
    case threeDays = "THREE_DAYS"
    case twentyEightDays = "TWENTY_EIGHT_DAYS"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = SubscriptionGracePeriodDuration(rawValue: string) {
            self = value
        } else if let value = SubscriptionGracePeriodDuration(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid SubscriptionGracePeriodDuration value: \(string)"
            )
        }
    }
}
