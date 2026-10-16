import BagbutikCore
import Foundation

/**
 # AppAssetLibraryAssetCategory

 String that represents the category of an app asset library asset.

 ```
 string AppAssetLibraryAssetCategory
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibraryassetcategory>
 */
public enum AppAssetLibraryAssetCategory: String, Sendable, ParameterValue, Codable, CaseIterable {
    case appScreenshotsAndPreviews = "APP_SCREENSHOTS_AND_PREVIEWS"
    case creativeAssets = "CREATIVE_ASSETS"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = AppAssetLibraryAssetCategory(rawValue: string) {
            self = value
        } else if let value = AppAssetLibraryAssetCategory(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid AppAssetLibraryAssetCategory value: \(string)"
            )
        }
    }
}
