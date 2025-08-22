import Bagbutik_Core
import Foundation

public enum CiCompletionStatus: String, Sendable, Codable, CaseIterable {
    case canceled = "CANCELED"
    case errored = "ERRORED"
    case failed = "FAILED"
    case skipped = "SKIPPED"
    case succeeded = "SUCCEEDED"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = CiCompletionStatus(rawValue: string) {
            self = value
        } else if let value = CiCompletionStatus(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid CiCompletionStatus value: \(string)"
            )
        }
    }
}
