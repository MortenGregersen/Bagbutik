import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify an auto-renewable subscription

     Update a specific auto-renewable subscription.

     ## Discussion

     > Note:
     > Changes that you make to product metadata with the App Store Connect API can take up to 1 hour to appear in the sandbox environment.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-subscriptions-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Subscription representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionV1(id: String,
                                     requestBody: SubscriptionUpdateRequest) -> Request<SubscriptionResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptions/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
