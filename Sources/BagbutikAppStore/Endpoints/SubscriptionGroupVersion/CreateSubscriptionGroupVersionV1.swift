import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a subscription group version

     Create a draft version of a subscription group, capturing its current localized metadata for App Review submission.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptionGroupVersions>

     - Parameter requestBody: SubscriptionGroupVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionGroupVersionV1(requestBody: SubscriptionGroupVersionCreateRequest) -> Request<SubscriptionGroupVersionResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionGroupVersions",
            method: .post,
            requestBody: requestBody)
    }
}
