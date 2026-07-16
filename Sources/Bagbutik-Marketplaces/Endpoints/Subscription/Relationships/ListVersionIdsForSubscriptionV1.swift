import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List version IDs for a subscription
     Get the related resource IDs for the draft versions of an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptions-_id_-relationships-versions>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVersionIdsForSubscriptionV1(id: String,
                                                limit: Int? = nil) -> Request<SubscriptionVersionsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptions/\(id)/relationships/versions",
            method: .get,
            parameters: .init(limit: limit))
    }
}
