import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List plan availability IDs for a subscription
     Get a list of plan availability resource IDs for a specific auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptions-_id_-relationships-planAvailabilities>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPlanAvailabilityIdsForSubscriptionV1(id: String,
                                                         limit: Int? = nil) -> Request<SubscriptionPlanAvailabilitiesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptions/\(id)/relationships/planAvailabilities",
            method: .get,
            parameters: .init(limit: limit))
    }
}
