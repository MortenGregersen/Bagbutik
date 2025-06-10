import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/apps/{id}/relationships/subscriptionGracePeriod

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-relationships-subscriptionGracePeriod>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSubscriptionGracePeriodIdsForAppV1(id: String) -> Request<AppSubscriptionGracePeriodLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/subscriptionGracePeriod",
            method: .get)
    }
}
