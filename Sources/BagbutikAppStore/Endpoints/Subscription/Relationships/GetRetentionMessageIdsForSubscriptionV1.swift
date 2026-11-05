import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Read the retention message ID for a subscription

     Get the retention message ID for a specific auto-renewable subscription.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptions-_id_-relationships-retentionMessage>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getRetentionMessageIdsForSubscriptionV1(id: String) -> Request<SubscriptionRetentionMessageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptions/\(id)/relationships/retentionMessage",
            method: .get)
    }
}
