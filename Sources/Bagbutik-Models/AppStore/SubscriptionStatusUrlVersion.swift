import Bagbutik_Core
import Foundation

/**
 # SubscriptionStatusUrlVersion
 Strings that represent versions of App Store server notifications.

 For more infomation see [Enabling App Store Server Notifications](https://developer.apple.com/documentation/appstoreservernotifications/enabling_app_store_server_notifications).

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/subscriptionstatusurlversion>
 */
public enum SubscriptionStatusUrlVersion: String, Sendable, Codable, CaseIterable {
    /// Version 1 notifications are simpler and contain less information than Version 2. For more information see [App Store Server Notifications V1](https://developer.apple.com/documentation/appstoreservernotifications/app_store_server_notifications_v1).
    case V1
    /// Version 2 notifications cover more events in the customer lifecycle, including subscription expirations, offer redemptions, refunds, and more. For more information see [App Store Server Notifications V2](https://developer.apple.com/documentation/appstoreservernotifications/app_store_server_notifications_v2).
    case V2
    /// Version 1 notifications are simpler and contain less information than Version 2. For more information see [App Store Server Notifications V1](https://developer.apple.com/documentation/appstoreservernotifications/app_store_server_notifications_v1).
    case v1
    /// Version 2 notifications cover more events in the customer lifecycle, including subscription expirations, offer redemptions, refunds, and more. For more information see [App Store Server Notifications V2](https://developer.apple.com/documentation/appstoreservernotifications/app_store_server_notifications_v2).
    case v2
}
