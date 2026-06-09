import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List available territory IDs for a subscription plan availability
     Get a list of available territory resource IDs for a specific subscription plan availability.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionPlanAvailabilities-_id_-relationships-availableTerritories>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAvailableTerritoryIdsForSubscriptionPlanAvailabilityV1(id: String,
                                                                           limit: Int? = nil) -> Request<SubscriptionPlanAvailabilityAvailableTerritoriesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionPlanAvailabilities/\(id)/relationships/availableTerritories",
            method: .get,
            parameters: .init(limit: limit))
    }
}
