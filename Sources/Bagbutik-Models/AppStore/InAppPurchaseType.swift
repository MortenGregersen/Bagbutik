import Bagbutik_Core
import Foundation

public enum InAppPurchaseType: String, Sendable, ParameterValue, Codable, CaseIterable {
    case consumable = "CONSUMABLE"
    case nonConsumable = "NON_CONSUMABLE"
    case nonRenewingSubscription = "NON_RENEWING_SUBSCRIPTION"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = InAppPurchaseType(rawValue: string) {
            self = value
        } else if let value = InAppPurchaseType(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid InAppPurchaseType value: \(string)"
            )
        }
    }
}
