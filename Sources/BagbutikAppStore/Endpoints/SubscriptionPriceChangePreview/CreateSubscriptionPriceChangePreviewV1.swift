import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a subscription price change preview

     Preview how proposed subscription prices, including volume pricing tiers, change what existing subscribers pay.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptionPriceChangePreviews>

     - Parameter requestBody: SubscriptionPriceChangePreview representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionPriceChangePreviewV1(requestBody: SubscriptionPriceChangePreviewCreateRequest) -> Request<SubscriptionPriceChangePreviewResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionPriceChangePreviews",
            method: .post,
            requestBody: requestBody)
    }
}
