import BagbutikCore
import Foundation

/**
 # AppEventAssetType

 A string that represents the type of asset for an app event.

 ```
 string AppEventAssetType
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appeventassettype>
 */
public enum AppEventAssetType: String, Sendable, Codable, CaseIterable {
    case eventCard = "EVENT_CARD"
    case eventDetailsPage = "EVENT_DETAILS_PAGE"

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = AppEventAssetType(rawValue: string) {
            self = value
        } else if let value = AppEventAssetType(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid AppEventAssetType value: \(string)"
            )
        }
    }
}
