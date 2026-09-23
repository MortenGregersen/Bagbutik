import BagbutikCore
import Foundation

/**
 # CiTestStatus

 A string that represents test status information.

 ```
 string CiTestStatus
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/citeststatus>
 */
public enum CiTestStatus: String, Sendable, Codable, CaseIterable {
    case expectedFailure = "EXPECTED_FAILURE"
    case failure = "FAILURE"
    case mixed = "MIXED"
    case skipped = "SKIPPED"
    case success = "SUCCESS"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = CiTestStatus(rawValue: string) {
            self = value
        } else if let value = CiTestStatus(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid CiTestStatus value: \(string)"
            )
        }
    }
}
