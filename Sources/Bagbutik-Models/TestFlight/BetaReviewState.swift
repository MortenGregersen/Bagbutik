import Bagbutik_Core
import Foundation

public enum BetaReviewState: String, Sendable, ParameterValue, Codable, CaseIterable {
    case approved = "APPROVED"
    case inReview = "IN_REVIEW"
    case rejected = "REJECTED"
    case waitingForReview = "WAITING_FOR_REVIEW"
}
