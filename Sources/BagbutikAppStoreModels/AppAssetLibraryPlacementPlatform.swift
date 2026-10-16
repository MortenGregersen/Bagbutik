import BagbutikCore
import Foundation

/**
 # AppAssetLibraryPlacementPlatform

 String that represents the platform of an app asset library placement.

 ```
 string AppAssetLibraryPlacementPlatform
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibraryplacementplatform>
 */
public enum AppAssetLibraryPlacementPlatform: String, Sendable, Codable, CaseIterable {
    case any = "ANY"
    case iMessageAppStore = "IMESSAGE_APP_STORE"
    case iPadAppStore = "IPAD_APP_STORE"
    case iPhoneAppStore = "IPHONE_APP_STORE"
    case macAppStore = "MAC_APP_STORE"
    case tvAppStore = "TV_APP_STORE"
    case visionProAppStore = "VISION_PRO_APP_STORE"
    case watchAppStore = "WATCH_APP_STORE"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = AppAssetLibraryPlacementPlatform(rawValue: string) {
            self = value
        } else if let value = AppAssetLibraryPlacementPlatform(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid AppAssetLibraryPlacementPlatform value: \(string)"
            )
        }
    }
}
