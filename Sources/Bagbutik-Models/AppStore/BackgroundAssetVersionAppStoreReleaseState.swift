import Bagbutik_Core
import Foundation

public enum BackgroundAssetVersionAppStoreReleaseState: String, Sendable, ParameterValue, Codable, CaseIterable {
    case accepted = "ACCEPTED"
    case inReview = "IN_REVIEW"
    case prepareForSubmission = "PREPARE_FOR_SUBMISSION"
    case processingForDistribution = "PROCESSING_FOR_DISTRIBUTION"
    case readyForDistribution = "READY_FOR_DISTRIBUTION"
    case readyForReview = "READY_FOR_REVIEW"
    case rejected = "REJECTED"
    case superseded = "SUPERSEDED"
    case waitingForReview = "WAITING_FOR_REVIEW"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = BackgroundAssetVersionAppStoreReleaseState(rawValue: string) {
            self = value
        } else if let value = BackgroundAssetVersionAppStoreReleaseState(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid BackgroundAssetVersionAppStoreReleaseState value: \(string)"
            )
        }
    }
}
