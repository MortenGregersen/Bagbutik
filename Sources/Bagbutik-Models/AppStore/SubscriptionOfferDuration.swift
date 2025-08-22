import Bagbutik_Core
import Foundation

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
