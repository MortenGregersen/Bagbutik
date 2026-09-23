import BagbutikCore
import Foundation

/**
 # IconAssetType

 String that represents the type of icon contained in the build.

 ```
 string IconAssetType
 ```

 ## Discussion

 -`APP_STORE`:
 -`MESSAGES_APP_STORE`:
 -`WATCH_APP_STORE`:
 -`TV_OS_HOME_SCREEN`:
 -`TV_OS_TOP_SHELF`:
 -`ALTERNATE_EXPERIMENT`:

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/iconassettype>
 */
public enum IconAssetType: String, Sendable, Codable, CaseIterable {
    case alternateExperiment = "ALTERNATE_EXPERIMENT"
    case appStore = "APP_STORE"
    case messagesAppStore = "MESSAGES_APP_STORE"
    case tvOSHomeScreen = "TV_OS_HOME_SCREEN"
    case tvOSTopShelf = "TV_OS_TOP_SHELF"
    case watchAppStore = "WATCH_APP_STORE"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = IconAssetType(rawValue: string) {
            self = value
        } else if let value = IconAssetType(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid IconAssetType value: \(string)"
            )
        }
    }
}
