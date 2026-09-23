import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a subscription version

     Create a draft version of an auto-renewable subscription, capturing its current localized metadata and review images for App Review submission.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptionVersions>

     - Parameter requestBody: SubscriptionVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionVersionV1(requestBody: SubscriptionVersionCreateRequest) -> Request<SubscriptionVersionResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionVersions",
            method: .post,
            requestBody: requestBody)
    }
}
