import BagbutikCore
import Foundation

/**
 # SubscriptionOfferDuration

 A length of time that can be assigned to a subscription.

 ```
 string SubscriptionOfferDuration
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionofferduration>
 */
public enum SubscriptionOfferDuration: String, Sendable, Codable, CaseIterable {
    case oneMonth = "ONE_MONTH"
    case oneWeek = "ONE_WEEK"
    case oneYear = "ONE_YEAR"
    case sixMonths = "SIX_MONTHS"
    case threeDays = "THREE_DAYS"
    case threeMonths = "THREE_MONTHS"
    case twoMonths = "TWO_MONTHS"
    case twoWeeks = "TWO_WEEKS"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = SubscriptionOfferDuration(rawValue: string) {
            self = value
        } else if let value = SubscriptionOfferDuration(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid SubscriptionOfferDuration value: \(string)"
            )
        }
    }
}
