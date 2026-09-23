import BagbutikCore
import Foundation

/**
 # SubscriptionCustomerEligibility

 A string that represents a customer’s eligibility for a subscription offer.

 ```
 string SubscriptionCustomerEligibility
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptioncustomereligibility>
 */
public enum SubscriptionCustomerEligibility: String, Sendable, Codable, CaseIterable {
    case existing = "EXISTING"
    case expired = "EXPIRED"
    case new = "NEW"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = SubscriptionCustomerEligibility(rawValue: string) {
            self = value
        } else if let value = SubscriptionCustomerEligibility(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid SubscriptionCustomerEligibility value: \(string)"
            )
        }
    }
}
