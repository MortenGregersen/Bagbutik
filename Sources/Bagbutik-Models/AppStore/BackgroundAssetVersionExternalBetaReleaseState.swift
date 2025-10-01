import Bagbutik_Core
import Foundation

public enum BackgroundAssetVersionExternalBetaReleaseState: String, Sendable, ParameterValue, Codable, CaseIterable {
    case inReview = "IN_REVIEW"
    case processingForTesting = "PROCESSING_FOR_TESTING"
    case readyForBetaSubmission = "READY_FOR_BETA_SUBMISSION"
    case readyForTesting = "READY_FOR_TESTING"
    case rejected = "REJECTED"
    case superseded = "SUPERSEDED"
    case waitingForReview = "WAITING_FOR_REVIEW"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = BackgroundAssetVersionExternalBetaReleaseState(rawValue: string) {
            self = value
        } else if let value = BackgroundAssetVersionExternalBetaReleaseState(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid BackgroundAssetVersionExternalBetaReleaseState value: \(string)"
            )
        }
    }
}
