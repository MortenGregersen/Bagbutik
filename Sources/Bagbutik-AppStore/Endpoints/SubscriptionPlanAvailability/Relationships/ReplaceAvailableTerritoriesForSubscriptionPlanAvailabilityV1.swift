import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Replace the available territories for a subscription plan availability
     Replace the list of available territories for a specific subscription plan availability.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-subscriptionPlanAvailabilities-_id_-relationships-availableTerritories>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func replaceAvailableTerritoriesForSubscriptionPlanAvailabilityV1(id: String,
                                                                             requestBody: SubscriptionPlanAvailabilityAvailableTerritoriesLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionPlanAvailabilities/\(id)/relationships/availableTerritories",
            method: .patch,
            requestBody: requestBody)
    }
}
