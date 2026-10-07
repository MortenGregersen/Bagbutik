import BagbutikCore
import Foundation

/**
 # AppAssetLibraryPlacementType

 String that represents the type of an app asset library placement.

 ```
 string AppAssetLibraryPlacementType
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibraryplacementtype>
 */
public enum AppAssetLibraryPlacementType: String, Sendable, ParameterValue, Codable, CaseIterable {
    case appPreview = "APP_PREVIEW"
    case appScreenshot = "APP_SCREENSHOT"
    case appStoreSearchResultsAsset = "APP_STORE_SEARCH_RESULTS_ASSET"
    case eventCardAsset = "EVENT_CARD_ASSET"
    case eventDetailsPageAsset = "EVENT_DETAILS_PAGE_ASSET"
    case iMessageAppScreenshot = "IMESSAGE_APP_SCREENSHOT"
    case productPageHeaderAsset = "PRODUCT_PAGE_HEADER_ASSET"
    case retentionMessageAsset = "RETENTION_MESSAGE_ASSET"
    case searchResultsAdsAsset = "SEARCH_RESULTS_ADS_ASSET"
    case todayTabAdsAsset = "TODAY_TAB_ADS_ASSET"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = AppAssetLibraryPlacementType(rawValue: string) {
            self = value
        } else if let value = AppAssetLibraryPlacementType(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid AppAssetLibraryPlacementType value: \(string)"
            )
        }
    }
}
