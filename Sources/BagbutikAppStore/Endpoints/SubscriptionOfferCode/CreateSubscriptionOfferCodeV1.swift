import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a subscription offer

     Create a subscription offer that provides offer codes for an auto-renewable subscription.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptionOfferCodes>

     - Parameter requestBody: SubscriptionOfferCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionOfferCodeV1(requestBody: SubscriptionOfferCodeCreateRequest) -> Request<SubscriptionOfferCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionOfferCodes",
            method: .post,
            requestBody: requestBody)
    }
}
