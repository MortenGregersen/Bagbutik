import BagbutikCore
import Foundation

/**
 # AppAssetLibraryAssetState

 String that represents the state of an app asset library asset.

 ```
 string AppAssetLibraryAssetState
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibraryassetstate>
 */
public enum AppAssetLibraryAssetState: String, Sendable, ParameterValue, Codable, CaseIterable {
    case accepted = "ACCEPTED"
    case approved = "APPROVED"
    case archived = "ARCHIVED"
    case awaitingUpload = "AWAITING_UPLOAD"
    case complete = "COMPLETE"
    case failed = "FAILED"
    case inReview = "IN_REVIEW"
    case prepareForSubmission = "PREPARE_FOR_SUBMISSION"
    case readyForReview = "READY_FOR_REVIEW"
    case rejected = "REJECTED"
    case uploadComplete = "UPLOAD_COMPLETE"
    case waitingForReview = "WAITING_FOR_REVIEW"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = AppAssetLibraryAssetState(rawValue: string) {
            self = value
        } else if let value = AppAssetLibraryAssetState(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid AppAssetLibraryAssetState value: \(string)"
            )
        }
    }
}
