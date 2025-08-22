import Bagbutik_Core
import Foundation

public enum BetaReviewState: String, Sendable, ParameterValue, Codable, CaseIterable {
    case approved = "APPROVED"
    case inReview = "IN_REVIEW"
    case rejected = "REJECTED"
    case waitingForReview = "WAITING_FOR_REVIEW"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = BetaReviewState(rawValue: string) {
            self = value
        } else if let value = BetaReviewState(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid BetaReviewState value: \(string)"
            )
        }
    }
}
