import BagbutikCore
import Foundation

/**
 # BackgroundAssetVersionState

 The possible states for a background asset version.

 ```
 string BackgroundAssetVersionState
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/backgroundassetversionstate>
 */
public enum BackgroundAssetVersionState: String, Sendable, ParameterValue, Codable, CaseIterable {
    case awaitingUpload = "AWAITING_UPLOAD"
    case complete = "COMPLETE"
    case failed = "FAILED"
    case processing = "PROCESSING"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = BackgroundAssetVersionState(rawValue: string) {
            self = value
        } else if let value = BackgroundAssetVersionState(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid BackgroundAssetVersionState value: \(string)"
            )
        }
    }
}
