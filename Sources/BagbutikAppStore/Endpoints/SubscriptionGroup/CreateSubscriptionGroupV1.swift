import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a subscription group

     Create a subscription group for an app.

     ## Discussion

     > Note:
     > Changes that you make to product metadata with the App Store Connect API can take up to 1 hour to appear in the sandbox environment.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptionGroups>

     - Parameter requestBody: SubscriptionGroup representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionGroupV1(requestBody: SubscriptionGroupCreateRequest) -> Request<SubscriptionGroupResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionGroups",
            method: .post,
            requestBody: requestBody)
    }
}
