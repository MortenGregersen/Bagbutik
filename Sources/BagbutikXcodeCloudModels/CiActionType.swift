import BagbutikCore
import Foundation

/**
 # CiActionType

 A string that represents the type of an Xcode Cloud workflow’s action.

 ```
 string CiActionType
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciactiontype>
 */
public enum CiActionType: String, Sendable, Codable, CaseIterable {
    case analyze = "ANALYZE"
    case archive = "ARCHIVE"
    case build = "BUILD"
    case test = "TEST"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = CiActionType(rawValue: string) {
            self = value
        } else if let value = CiActionType(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid CiActionType value: \(string)"
            )
        }
    }
}
