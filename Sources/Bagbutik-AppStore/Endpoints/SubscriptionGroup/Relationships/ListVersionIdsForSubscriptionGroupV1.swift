import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get the resource IDs of the versions of a subscription group
     Get the related resource IDs for the draft versions of a subscription group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionGroups-_id_-relationships-versions>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVersionIdsForSubscriptionGroupV1(id: String,
                                                     limit: Int? = nil) -> Request<SubscriptionGroupVersionsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionGroups/\(id)/relationships/versions",
            method: .get,
            parameters: .init(limit: limit))
    }
}
