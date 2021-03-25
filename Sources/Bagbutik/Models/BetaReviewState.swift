import Foundation

/// String that indicates the review state of a beta app.
public enum BetaReviewState: String, Codable, CaseIterable {
    case waitingForReview = "WAITING_FOR_REVIEW"
    case inReview = "IN_REVIEW"
    case rejected = "REJECTED"
    case approved = "APPROVED"
}
