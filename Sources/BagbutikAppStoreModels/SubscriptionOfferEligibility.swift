import BagbutikCore
import Foundation

/**
 # SubscriptionOfferEligibility

 A string that represents the eligibility of a subscription offer.

 ```
 string SubscriptionOfferEligibility
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionoffereligibility>
 */
public enum SubscriptionOfferEligibility: String, Sendable, Codable, CaseIterable {
    case replaceIntroOffers = "REPLACE_INTRO_OFFERS"
    case stackWithIntroOffers = "STACK_WITH_INTRO_OFFERS"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = SubscriptionOfferEligibility(rawValue: string) {
            self = value
        } else if let value = SubscriptionOfferEligibility(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid SubscriptionOfferEligibility value: \(string)"
            )
        }
    }
}
