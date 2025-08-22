import Bagbutik_Core
import Foundation

public enum CiExecutionProgress: String, Sendable, Codable, CaseIterable {
    case complete = "COMPLETE"
    case pending = "PENDING"
    case running = "RUNNING"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = CiExecutionProgress(rawValue: string) {
            self = value
        } else if let value = CiExecutionProgress(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid CiExecutionProgress value: \(string)"
            )
        }
    }
}
