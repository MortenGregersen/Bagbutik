import Bagbutik_Core
import Foundation

public enum BuildUploadState: String, Sendable, Codable, CaseIterable {
    case awaitingUpload = "AWAITING_UPLOAD"
    case complete = "COMPLETE"
    case failed = "FAILED"
    case processing = "PROCESSING"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = BuildUploadState(rawValue: string) {
            self = value
        } else if let value = BuildUploadState(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid BuildUploadState value: \(string)"
            )
        }
    }
}
