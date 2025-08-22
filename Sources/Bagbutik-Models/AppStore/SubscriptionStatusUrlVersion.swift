import Bagbutik_Core
import Foundation

public enum SubscriptionStatusUrlVersion: String, Sendable, Codable, CaseIterable {
    case V1
    case V2

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = SubscriptionStatusUrlVersion(rawValue: string) {
            self = value
        } else if let value = SubscriptionStatusUrlVersion(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid SubscriptionStatusUrlVersion value: \(string)"
            )
        }
    }
}
