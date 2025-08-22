import Bagbutik_Core
import Foundation

public enum CiTestStatus: String, Sendable, Codable, CaseIterable {
    case expectedFailure = "EXPECTED_FAILURE"
    case failure = "FAILURE"
    case mixed = "MIXED"
    case skipped = "SKIPPED"
    case success = "SUCCESS"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = CiTestStatus(rawValue: string) {
            self = value
        } else if let value = CiTestStatus(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid CiTestStatus value: \(string)"
            )
        }
    }
}
