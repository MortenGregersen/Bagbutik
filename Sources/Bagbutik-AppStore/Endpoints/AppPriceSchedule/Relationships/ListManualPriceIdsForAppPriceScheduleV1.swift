import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/appPriceSchedules/{id}/relationships/manualPrices

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appPriceSchedules-_id_-relationships-manualPrices>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listManualPriceIdsForAppPriceScheduleV1(id: String,
                                                        limit: Int? = nil) -> Request<AppPriceScheduleManualPricesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appPriceSchedules/\(id)/relationships/manualPrices",
            method: .get,
            parameters: .init(limit: limit))
    }
}
