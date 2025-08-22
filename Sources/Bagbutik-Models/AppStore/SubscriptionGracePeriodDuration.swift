import Bagbutik_Core
import Foundation

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
