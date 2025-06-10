import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v2/inAppPurchases/{id}/relationships/images

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-inAppPurchases-_id_-relationships-images>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listImageIdsForInAppPurchasesV2(id: String,
                                                limit: Int? = nil) -> Request<InAppPurchaseV2ImagesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchases/\(id)/relationships/images",
            method: .get,
            parameters: .init(limit: limit))
    }
}
