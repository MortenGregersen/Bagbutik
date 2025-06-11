import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/inAppPurchasePricePoints/{id}/relationships/equalizations

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchasePricePoints-_id_-relationships-equalizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 8000
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listEqualizationIdsForInAppPurchasePricePointV1(id: String,
                                                                limit: Int? = nil) -> Request<InAppPurchasePricePointEqualizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchasePricePoints/\(id)/relationships/equalizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}
