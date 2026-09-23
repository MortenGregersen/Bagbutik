import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # Remove a promoted purchase

     Remove a promotion for an in-app purchase or auto-renewable subscription from the App Store listing.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-promotedPurchases-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deletePromotedPurchaseV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/promotedPurchases/\(id)",
            method: .delete)
    }
}
