import BagbutikCore
import Foundation

/**
 # SubscriptionOfferMode

 A string that indicates the payment mode of a subscription offer.

 ```
 string SubscriptionOfferMode
 ```

 ## Discussion

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionoffermode>
 */
public enum SubscriptionOfferMode: String, Sendable, Codable, CaseIterable {
    case freeTrial = "FREE_TRIAL"
    case payAsYouGo = "PAY_AS_YOU_GO"
    case payUpFront = "PAY_UP_FRONT"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = SubscriptionOfferMode(rawValue: string) {
            self = value
        } else if let value = SubscriptionOfferMode(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid SubscriptionOfferMode value: \(string)"
            )
        }
    }
}
