import BagbutikCore
import Foundation

/**
 # AppAssetLibraryMediaType

 String that represents the media type of an app asset library asset.

 ```
 string AppAssetLibraryMediaType
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibrarymediatype>
 */
public enum AppAssetLibraryMediaType: String, Sendable, Codable, CaseIterable {
    case image = "IMAGE"
    case video = "VIDEO"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = AppAssetLibraryMediaType(rawValue: string) {
            self = value
        } else if let value = AppAssetLibraryMediaType(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid AppAssetLibraryMediaType value: \(string)"
            )
        }
    }
}
