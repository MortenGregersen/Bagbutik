import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List All Values for an In-App Purchase Offer Code One-Time Use Code

     Get a list of values for a specific In-App Purchase offer code one-time use code.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchaseOfferCodeOneTimeUseCodes-_id_-values>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getValuesForInAppPurchaseOfferCodeOneTimeUseCodeV1(id: String) -> Request<Csv, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseOfferCodeOneTimeUseCodes/\(id)/values",
            method: .get)
    }
}
