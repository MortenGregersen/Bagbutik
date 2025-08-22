import Bagbutik_Core
import Foundation

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
