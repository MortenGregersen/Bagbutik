import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a subscription price change

     Schedule a subscription price change for a specific territory.

     ## Discussion

     > Note:
     > Changes that you make to product metadata with the App Store Connect API can take up to 1 hour to appear in the sandbox environment.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptionPrices>

     - Parameter requestBody: SubscriptionPrice representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionPriceV1(requestBody: SubscriptionPriceCreateRequest) -> Request<SubscriptionPriceResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionPrices",
            method: .post,
            requestBody: requestBody)
    }
}
