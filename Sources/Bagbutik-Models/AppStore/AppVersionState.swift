import Bagbutik_Core
import Foundation

public enum AppVersionState: String, Sendable, ParameterValue, Codable, CaseIterable {
    case accepted = "ACCEPTED"
    case developerRejected = "DEVELOPER_REJECTED"
    case inReview = "IN_REVIEW"
    case invalidBinary = "INVALID_BINARY"
    case metadataRejected = "METADATA_REJECTED"
    case pendingAppleRelease = "PENDING_APPLE_RELEASE"
    case pendingDeveloperRelease = "PENDING_DEVELOPER_RELEASE"
    case prepareForSubmission = "PREPARE_FOR_SUBMISSION"
    case processingForDistribution = "PROCESSING_FOR_DISTRIBUTION"
    case readyForDistribution = "READY_FOR_DISTRIBUTION"
    case readyForReview = "READY_FOR_REVIEW"
    case rejected = "REJECTED"
    case replacedWithNewVersion = "REPLACED_WITH_NEW_VERSION"
    case waitingForExportCompliance = "WAITING_FOR_EXPORT_COMPLIANCE"
    case waitingForReview = "WAITING_FOR_REVIEW"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = AppVersionState(rawValue: string) {
            self = value
        } else if let value = AppVersionState(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid AppVersionState value: \(string)"
            )
        }
    }
}
