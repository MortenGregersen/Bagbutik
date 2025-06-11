import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/subscriptionAvailabilities/{id}/relationships/availableTerritories

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionAvailabilities-_id_-relationships-availableTerritories>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAvailableTerritoryIdsForSubscriptionAvailabilityV1(id: String,
                                                                       limit: Int? = nil) -> Request<SubscriptionAvailabilityAvailableTerritoriesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionAvailabilities/\(id)/relationships/availableTerritories",
            method: .get,
            parameters: .init(limit: limit))
    }
}
