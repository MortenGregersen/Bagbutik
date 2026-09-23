import BagbutikCore
import Foundation

/**
 # CiCompletionStatus

 A string that represents the completion status of an Xcode Cloud build.

 ```
 string CiCompletionStatus
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cicompletionstatus>
 */
public enum CiCompletionStatus: String, Sendable, Codable, CaseIterable {
    case canceled = "CANCELED"
    case errored = "ERRORED"
    case failed = "FAILED"
    case skipped = "SKIPPED"
    case succeeded = "SUCCEEDED"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = CiCompletionStatus(rawValue: string) {
            self = value
        } else if let value = CiCompletionStatus(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid CiCompletionStatus value: \(string)"
            )
        }
    }
}
