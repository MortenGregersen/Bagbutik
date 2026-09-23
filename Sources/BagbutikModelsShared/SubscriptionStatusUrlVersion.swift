import BagbutikCore
import Foundation

/**
 # SubscriptionStatusUrlVersion

 Strings that represent versions of App Store Server Notifications.

 ```
 string SubscriptionStatusUrlVersion
 ```

 ## Discussion

 For more infomation see [Enabling App Store Server Notifications](https://developer.apple.com/documentation/appstoreservernotifications/enabling-app-store-server-notifications).

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionstatusurlversion>
 */
public enum SubscriptionStatusUrlVersion: String, Sendable, Codable, CaseIterable {
    case V1
    case V2

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        if let value = SubscriptionStatusUrlVersion(rawValue: string) {
            self = value
        } else if let value = SubscriptionStatusUrlVersion(rawValue: string.uppercased()) {
            self = value
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid SubscriptionStatusUrlVersion value: \(string)"
            )
        }
    }
}
