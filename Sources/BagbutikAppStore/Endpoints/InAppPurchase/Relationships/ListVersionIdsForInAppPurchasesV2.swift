import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Get the resource IDs of the versions of an In-App Purchase

     Get the related resource IDs for the draft versions of an In-App Purchase configured with the v2 API.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-inAppPurchases-_id_-relationships-versions>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVersionIdsForInAppPurchasesV2(id: String,
                                                  limit: Int? = nil) -> Request<InAppPurchaseV2VersionsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchases/\(id)/relationships/versions",
            method: .get,
            parameters: .init(limit: limit))
    }
}
