import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an subscription image
     Delete the image asset that appears on the App Store listing that represents an subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-subscriptionImages-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteSubscriptionImageV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/subscriptionImages/\(id)", method: .delete)
    }
}
