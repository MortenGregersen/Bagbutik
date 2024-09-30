import Bagbutik_Core
import Foundation

/**
 # BetaReviewState
 String that indicates the review state of a beta app.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betareviewstate>
 */
public enum BetaReviewState: String, Sendable, ParameterValue, Codable, CaseIterable {
    case approved = "APPROVED"
    case inReview = "IN_REVIEW"
    case rejected = "REJECTED"
    case waitingForReview = "WAITING_FOR_REVIEW"
}
