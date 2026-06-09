import Bagbutik_Core
import Foundation

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
