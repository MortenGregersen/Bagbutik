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
}
