import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/subscriptions/{id}/relationships/subscriptionLocalizations

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptions-_id_-relationships-subscriptionLocalizations>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listSubscriptionLocalizationIdsForSubscriptionV1(id: String,
                                                                 limit: Int? = nil) -> Request<SubscriptionSubscriptionLocalizationsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptions/\(id)/relationships/subscriptionLocalizations",
            method: .get,
            parameters: .init(limit: limit))
    }
}
