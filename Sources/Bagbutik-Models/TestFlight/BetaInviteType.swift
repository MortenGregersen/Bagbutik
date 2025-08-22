import Bagbutik_Core
import Foundation

public enum BetaInviteType: String, Sendable, ParameterValue, Codable, CaseIterable {
    case email = "EMAIL"
    case publicLink = "PUBLIC_LINK"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = BetaInviteType(rawValue: string) {
            self = value
        } else if let value = BetaInviteType(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid BetaInviteType value: \(string)"
            )
        }
    }
}
