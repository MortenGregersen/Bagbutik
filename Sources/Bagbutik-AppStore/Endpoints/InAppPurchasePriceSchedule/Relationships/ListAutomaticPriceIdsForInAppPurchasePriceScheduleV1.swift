import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/inAppPurchasePriceSchedules/{id}/relationships/automaticPrices

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchasePriceSchedules-_id_-relationships-automaticPrices>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAutomaticPriceIdsForInAppPurchasePriceScheduleV1(id: String,
                                                                     limit: Int? = nil) -> Request<InAppPurchasePriceScheduleAutomaticPricesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchasePriceSchedules/\(id)/relationships/automaticPrices",
            method: .get,
            parameters: .init(limit: limit))
    }
}
