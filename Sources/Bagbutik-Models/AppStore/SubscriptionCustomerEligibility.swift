import Bagbutik_Core
import Foundation

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
