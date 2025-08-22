import Bagbutik_Core
import Foundation

public enum CiActionType: String, Sendable, Codable, CaseIterable {
    case analyze = "ANALYZE"
    case archive = "ARCHIVE"
    case build = "BUILD"
    case test = "TEST"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = CiActionType(rawValue: string) {
            self = value
        } else if let value = CiActionType(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid CiActionType value: \(string)"
            )
        }
    }
}
