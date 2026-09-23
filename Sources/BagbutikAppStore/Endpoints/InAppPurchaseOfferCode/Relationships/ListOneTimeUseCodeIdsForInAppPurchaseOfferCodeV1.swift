import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Get All One-Time Use Code IDs for an In-App Purchase Offer Code

     Get a list of one-time use code resource IDs for a specific In-App Purchase offer code.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchaseOfferCodes-_id_-relationships-oneTimeUseCodes>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listOneTimeUseCodeIdsForInAppPurchaseOfferCodeV1(id: String,
                                                                 limit: Int? = nil) -> Request<InAppPurchaseOfferCodeOneTimeUseCodesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseOfferCodes/\(id)/relationships/oneTimeUseCodes",
            method: .get,
            parameters: .init(limit: limit))
    }
}
