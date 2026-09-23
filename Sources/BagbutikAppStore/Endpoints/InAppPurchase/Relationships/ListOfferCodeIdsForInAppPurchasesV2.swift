import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # GET /v2/inAppPurchases/{id}/relationships/offerCodes

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-inAppPurchases-_id_-relationships-offerCodes>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listOfferCodeIdsForInAppPurchasesV2(id: String,
                                                    limit: Int? = nil) -> Request<InAppPurchaseV2OfferCodesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchases/\(id)/relationships/offerCodes",
            method: .get,
            parameters: .init(limit: limit))
    }
}
