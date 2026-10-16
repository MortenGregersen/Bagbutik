import BagbutikCore
import Foundation

/**
 # AppAssetLibraryDisplayClass

 String that represents the display class of an app asset library asset.

 ```
 string AppAssetLibraryDisplayClass
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibrarydisplayclass>
 */
public enum AppAssetLibraryDisplayClass: String, Sendable, Codable, CaseIterable {
    case `default` = "DEFAULT"
    case iPad105Display = "IPAD_105_DISPLAY"
    case iPad11Display = "IPAD_11_DISPLAY"
    case iPad129Display = "IPAD_129_DISPLAY"
    case iPad13Display = "IPAD_13_DISPLAY"
    case iPad97Display = "IPAD_97_DISPLAY"
    case iPhoneDuo = "IPHONE_DUO"
    case iPhoneDynamicIslandLargeDisplay = "IPHONE_DYNAMIC_ISLAND_LARGE_DISPLAY"
    case iPhoneDynamicIslandMediumDisplay = "IPHONE_DYNAMIC_ISLAND_MEDIUM_DISPLAY"
    case iPhoneFaceIdLargeDisplay = "IPHONE_FACE_ID_LARGE_DISPLAY"
    case iPhoneFaceIdMediumDisplay = "IPHONE_FACE_ID_MEDIUM_DISPLAY"
    case iPhoneHomeButton35Display = "IPHONE_HOME_BUTTON_35_DISPLAY"
    case iPhoneHomeButton40Display = "IPHONE_HOME_BUTTON_40_DISPLAY"
    case iPhoneHomeButtonLargeDisplay = "IPHONE_HOME_BUTTON_LARGE_DISPLAY"
    case iPhoneHomeButtonMediumDisplay = "IPHONE_HOME_BUTTON_MEDIUM_DISPLAY"
    case watchSeries10 = "WATCH_SERIES_10"
    case watchSeries3 = "WATCH_SERIES_3"
    case watchSeries4 = "WATCH_SERIES_4"
    case watchSeries7 = "WATCH_SERIES_7"
    case watchUltra = "WATCH_ULTRA"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = AppAssetLibraryDisplayClass(rawValue: string) {
            self = value
        } else if let value = AppAssetLibraryDisplayClass(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid AppAssetLibraryDisplayClass value: \(string)"
            )
        }
    }
}
