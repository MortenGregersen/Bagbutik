import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get the resource IDs of the versions of an in-app purchase
     Get the related resource IDs for the draft versions of an in-app purchase configured with the v2 API.

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
