import BagbutikCore
import Foundation

/**
 # BackgroundAssetVersionExternalBetaReleaseState

 A string value identifying the current state of a background asset version’s external beta release.

 ```
 string BackgroundAssetVersionExternalBetaReleaseState
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/backgroundassetversionexternalbetareleasestate>
 */
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
