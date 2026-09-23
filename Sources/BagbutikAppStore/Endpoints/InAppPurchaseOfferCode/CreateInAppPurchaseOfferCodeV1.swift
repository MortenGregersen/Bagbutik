import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an In-App Purchase Offer Code

     Create an offer code for an In-App Purchase.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-inAppPurchaseOfferCodes>

     - Parameter requestBody: InAppPurchaseOfferCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchaseOfferCodeV1(requestBody: InAppPurchaseOfferCodeCreateRequest) -> Request<InAppPurchaseOfferCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseOfferCodes",
            method: .post,
            requestBody: requestBody)
    }
}
