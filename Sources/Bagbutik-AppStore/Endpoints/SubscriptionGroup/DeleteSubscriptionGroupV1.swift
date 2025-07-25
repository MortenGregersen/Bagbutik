import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a Subscription Group
     Delete a specific empty subscription group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-subscriptionGroups-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteSubscriptionGroupV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionGroups/\(id)",
            method: .delete)
    }
}
