import BagbutikCore
import Foundation

/**
 # CiExecutionProgress

 A string that represents the progress of an ongoing Xcode Cloud build.

 ```
 string CiExecutionProgress
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciexecutionprogress>
 */
public enum CiExecutionProgress: String, Sendable, Codable, CaseIterable {
    case complete = "COMPLETE"
    case pending = "PENDING"
    case running = "RUNNING"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = CiExecutionProgress(rawValue: string) {
            self = value
        } else if let value = CiExecutionProgress(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid CiExecutionProgress value: \(string)"
            )
        }
    }
}
