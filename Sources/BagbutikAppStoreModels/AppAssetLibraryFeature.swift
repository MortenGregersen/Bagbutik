import BagbutikCore
import Foundation

/**
 # AppAssetLibraryFeature

 String that represents the App Store feature an app asset library asset supports.

 ```
 string AppAssetLibraryFeature
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibraryfeature>
 */
public enum AppAssetLibraryFeature: String, Sendable, Codable, CaseIterable {
    case appClips = "APP_CLIPS"
    case appStoreVersions = "APP_STORE_VERSIONS"
    case appleAds = "APPLE_ADS"
    case customProductPages = "CUSTOM_PRODUCT_PAGES"
    case gameCenter = "GAME_CENTER"
    case inAppEvents = "IN_APP_EVENTS"
    case inAppPurchases = "IN_APP_PURCHASES"
    case productPageOptimizations = "PRODUCT_PAGE_OPTIMIZATIONS"
    case retentionMessaging = "RETENTION_MESSAGING"
    case subscriptions = "SUBSCRIPTIONS"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = AppAssetLibraryFeature(rawValue: string) {
            self = value
        } else if let value = AppAssetLibraryFeature(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid AppAssetLibraryFeature value: \(string)"
            )
        }
    }
}
