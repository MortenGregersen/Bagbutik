import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List localization IDs for an In-App Purchase

     Get a list of localization IDs for a specific In-App Purchase.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-inAppPurchases-_id_-relationships-inAppPurchaseLocalizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listInAppPurchaseLocalizationIdsForInAppPurchasesV2(id: String,
                                                                    limit: Int? = nil) -> Request<InAppPurchaseV2InAppPurchaseLocalizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchases/\(id)/relationships/inAppPurchaseLocalizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}
