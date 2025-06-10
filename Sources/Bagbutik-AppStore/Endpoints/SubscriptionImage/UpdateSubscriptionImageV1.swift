import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read subscription image information
     Read details about a specific subscription image.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-subscriptionImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionImageV1(id: String,
                                          requestBody: SubscriptionImageUpdateRequest) -> Request<SubscriptionImageResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionImages/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
