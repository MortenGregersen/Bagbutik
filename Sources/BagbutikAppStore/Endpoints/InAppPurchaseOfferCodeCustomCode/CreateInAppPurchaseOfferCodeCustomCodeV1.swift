import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an In-App Purchase Offer Code Custom Code

     Create a custom code for an In-App Purchase offer code.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-inAppPurchaseOfferCodeCustomCodes>

     - Parameter requestBody: InAppPurchaseOfferCodeCustomCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchaseOfferCodeCustomCodeV1(requestBody: InAppPurchaseOfferCodeCustomCodeCreateRequest) -> Request<InAppPurchaseOfferCodeCustomCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseOfferCodeCustomCodes",
            method: .post,
            requestBody: requestBody)
    }
}
