import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a subscription image

     Reserve a promotion image for an auto-renewable subscription configured with the v2 API and prepare its asset upload.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-subscriptionImages>

     - Parameter requestBody: SubscriptionImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionImagesV2(requestBody: SubscriptionImageV2CreateRequest) -> Request<SubscriptionImageV2Response, ErrorResponse> {
        .init(
            path: "/v2/subscriptionImages",
            method: .post,
            requestBody: requestBody)
    }
}
