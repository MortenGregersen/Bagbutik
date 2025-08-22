import Bagbutik_Core
import Foundation

public enum GameCenterVersionState: String, Sendable, Codable, CaseIterable {
    case accepted = "ACCEPTED"
    case inReview = "IN_REVIEW"
    case live = "LIVE"
    case pendingRelease = "PENDING_RELEASE"
    case prepareForSubmission = "PREPARE_FOR_SUBMISSION"
    case readyForReview = "READY_FOR_REVIEW"
    case rejected = "REJECTED"
    case replacedWithNewVersion = "REPLACED_WITH_NEW_VERSION"
    case waitingForReview = "WAITING_FOR_REVIEW"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = GameCenterVersionState(rawValue: string) {
            self = value
        } else if let value = GameCenterVersionState(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid GameCenterVersionState value: \(string)"
            )
        }
    }
}
