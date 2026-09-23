import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # Modify the order of a promoted purchase for an app

     Update the order of promoted purchases.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-apps-_id_-relationships-promotedPurchases>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replacePromotedPurchasesForAppV1(id: String,
                                                 requestBody: AppPromotedPurchasesLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/promotedPurchases",
            method: .patch,
            requestBody: requestBody)
    }
}
