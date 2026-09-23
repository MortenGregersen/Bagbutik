import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create custom offer codes

     Create custom offer codes for an auto-renewable subscription offer.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptionOfferCodeCustomCodes>

     - Parameter requestBody: SubscriptionOfferCodeCustomCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionOfferCodeCustomCodeV1(requestBody: SubscriptionOfferCodeCustomCodeCreateRequest) -> Request<SubscriptionOfferCodeCustomCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionOfferCodeCustomCodes",
            method: .post,
            requestBody: requestBody)
    }
}
