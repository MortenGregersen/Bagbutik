import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an In-App Purchase Offer Code One-Time Use Code

     Create a one-time use code for an In-App Purchase offer code.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-inAppPurchaseOfferCodeOneTimeUseCodes>

     - Parameter requestBody: InAppPurchaseOfferCodeOneTimeUseCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchaseOfferCodeOneTimeUseCodeV1(requestBody: InAppPurchaseOfferCodeOneTimeUseCodeCreateRequest) -> Request<InAppPurchaseOfferCodeOneTimeUseCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseOfferCodeOneTimeUseCodes",
            method: .post,
            requestBody: requestBody)
    }
}
