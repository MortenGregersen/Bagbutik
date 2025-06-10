import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/subscriptionGroups/{id}/relationships/subscriptions

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionGroups-_id_-relationships-subscriptions>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listSubscriptionIdsForSubscriptionGroupV1(id: String,
                                                          limit: Int? = nil) -> Request<SubscriptionGroupSubscriptionsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionGroups/\(id)/relationships/subscriptions",
            method: .get,
            parameters: .init(limit: limit))
    }
}
