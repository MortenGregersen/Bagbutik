import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a subscription image
     Delete a subscription image configured with the v2 API.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v2-subscriptionImages-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteSubscriptionImagesV2(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v2/subscriptionImages/\(id)",
            method: .delete)
    }
}
