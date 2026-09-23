import BagbutikCore
import Foundation

/**
 # BuildBundleType

 A string that represents the possible components of a build bundle.

 ```
 string BuildBundleType
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildbundletype>
 */
public enum BuildBundleType: String, Sendable, Codable, CaseIterable {
    case app = "APP"
    case appClip = "APP_CLIP"
    case watchApp = "WATCH_APP"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = BuildBundleType(rawValue: string) {
            self = value
        } else if let value = BuildBundleType(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid BuildBundleType value: \(string)"
            )
        }
    }
}
