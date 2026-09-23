import BagbutikCore
import Foundation

/**
 # BuildUploadState

 A string that represents the state of a build upload.

 ```
 string BuildUploadState
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/builduploadstate>
 */
public enum BuildUploadState: String, Sendable, Codable, CaseIterable {
    case awaitingUpload = "AWAITING_UPLOAD"
    case complete = "COMPLETE"
    case failed = "FAILED"
    case processing = "PROCESSING"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = BuildUploadState(rawValue: string) {
            self = value
        } else if let value = BuildUploadState(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid BuildUploadState value: \(string)"
            )
        }
    }
}
