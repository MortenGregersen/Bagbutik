import BagbutikCore
import Foundation

/**
 # BetaReviewState

 String that indicates the review state of a beta app.

 ```
 string BetaReviewState
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betareviewstate>
 */
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
