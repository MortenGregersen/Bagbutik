import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify a subscription group

     Update the reference name for a specific subscription group.

     ## Discussion

     > Note:
     > Changes that you make to product metadata with the App Store Connect API can take up to 1 hour to appear in the sandbox environment.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-subscriptionGroups-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionGroup representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionGroupV1(id: String,
                                          requestBody: SubscriptionGroupUpdateRequest) -> Request<SubscriptionGroupResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionGroups/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
