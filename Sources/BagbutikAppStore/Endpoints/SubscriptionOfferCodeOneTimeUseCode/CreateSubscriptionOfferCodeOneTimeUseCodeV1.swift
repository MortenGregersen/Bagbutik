import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create one-time use offer codes

     Create one-time use codes for an auto-renewable subscription offer.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptionOfferCodeOneTimeUseCodes>

     - Parameter requestBody: SubscriptionOfferCodeOneTimeUseCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionOfferCodeOneTimeUseCodeV1(requestBody: SubscriptionOfferCodeOneTimeUseCodeCreateRequest) -> Request<SubscriptionOfferCodeOneTimeUseCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionOfferCodeOneTimeUseCodes",
            method: .post,
            requestBody: requestBody)
    }
}
