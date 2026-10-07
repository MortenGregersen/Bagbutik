import BagbutikCore
import Foundation

/**
 # AppAssetLibraryPlacementState

 String that represents the state of an app asset library placement.

 ```
 string AppAssetLibraryPlacementState
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibraryplacementstate>
 */
public enum AppAssetLibraryPlacementState: String, Sendable, ParameterValue, Codable, CaseIterable {
    case assetProcessing = "ASSET_PROCESSING"
    case failed = "FAILED"
    case parentApproved = "PARENT_APPROVED"
    case parentInReview = "PARENT_IN_REVIEW"
    case parentPrepareForSubmission = "PARENT_PREPARE_FOR_SUBMISSION"
    case parentReadyForReview = "PARENT_READY_FOR_REVIEW"
    case parentWaitingForReview = "PARENT_WAITING_FOR_REVIEW"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = AppAssetLibraryPlacementState(rawValue: string) {
            self = value
        } else if let value = AppAssetLibraryPlacementState(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid AppAssetLibraryPlacementState value: \(string)"
            )
        }
    }
}
