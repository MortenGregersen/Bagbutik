import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify an In-App Purchase Offer Code One-Time Use Code

     Update a specific In-App Purchase offer code one-time use code.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-inAppPurchaseOfferCodeOneTimeUseCodes-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: InAppPurchaseOfferCodeOneTimeUseCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateInAppPurchaseOfferCodeOneTimeUseCodeV1(id: String,
                                                             requestBody: InAppPurchaseOfferCodeOneTimeUseCodeUpdateRequest) -> Request<InAppPurchaseOfferCodeOneTimeUseCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseOfferCodeOneTimeUseCodes/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
