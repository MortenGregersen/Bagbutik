import Bagbutik_Core
import Foundation

public enum BackgroundAssetVersionState: String, Sendable, ParameterValue, Codable, CaseIterable {
    case awaitingUpload = "AWAITING_UPLOAD"
    case complete = "COMPLETE"
    case failed = "FAILED"
    case processing = "PROCESSING"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = BackgroundAssetVersionState(rawValue: string) {
            self = value
        } else if let value = BackgroundAssetVersionState(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid BackgroundAssetVersionState value: \(string)"
            )
        }
    }
}
