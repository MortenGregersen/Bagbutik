import Bagbutik_Core
import Foundation

public enum PhasedReleaseState: String, Sendable, Codable, CaseIterable {
    case active = "ACTIVE"
    case complete = "COMPLETE"
    case inactive = "INACTIVE"
    case paused = "PAUSED"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = PhasedReleaseState(rawValue: string) {
            self = value
        } else if let value = PhasedReleaseState(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid PhasedReleaseState value: \(string)"
            )
        }
    }
}
