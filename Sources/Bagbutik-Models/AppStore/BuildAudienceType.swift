import Bagbutik_Core
import Foundation

public enum BuildAudienceType: String, Sendable, ParameterValue, Codable, CaseIterable {
    case appStoreEligible = "APP_STORE_ELIGIBLE"
    case internalOnly = "INTERNAL_ONLY"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = BuildAudienceType(rawValue: string) {
            self = value
        } else if let value = BuildAudienceType(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid BuildAudienceType value: \(string)"
            )
        }
    }
}
