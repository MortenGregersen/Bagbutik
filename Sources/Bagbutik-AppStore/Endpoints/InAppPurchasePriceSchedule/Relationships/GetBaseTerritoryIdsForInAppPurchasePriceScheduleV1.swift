import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/inAppPurchasePriceSchedules/{id}/relationships/baseTerritory

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchasePriceSchedules-_id_-relationships-baseTerritory>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getBaseTerritoryIdsForInAppPurchasePriceScheduleV1(id: String) -> Request<InAppPurchasePriceScheduleBaseTerritoryLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchasePriceSchedules/\(id)/relationships/baseTerritory",
            method: .get)
    }
}
